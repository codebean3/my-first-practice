import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
interface DeviceData {
  temperature: number;
  humidity: number;
  lightIntensity: number;
  waterPump: boolean;
}

interface CommandParams {
  value: boolean;
}

interface CommandData {
  service_id: string;
  command_name: string;
  paras: CommandParams;
}

interface ServiceProperty {
  temperature?: number;
  humidity?: number;
  lightIntensity?: number;
  waterPump?: boolean;
}

interface ServiceItem {
  service_id: string;
  properties: ServiceProperty;
}

interface HuaweiCloudResponse {
  services?: ServiceItem[];
  properties?: ServiceProperty;
}

export class HuaweiCloudService {
  private accessToken: string = 'abcd1234';
  private deviceId: string = '68f246c7ef46cd424ce4e6c6_bqbxd';
  private projectId: string = '68f246c7ef46cd424ce4e6c6';
  private baseUrl: string = 'https://iotda.cn-north-4.myhuaweicloud.com/v5/iot';

  // 发送控制命令到设备
  async sendControlCommand(command: string, value: boolean): Promise<void> {
    const httpRequest = http.createHttp();
    const url = `${this.baseUrl}/${this.projectId}/devices/${this.deviceId}/commands`;

    const commandData: CommandData = {
      service_id: "Agriculture",
      command_name: command,
      paras: {
        value: value
      }
    };

    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json',
        'X-Auth-Token': this.accessToken
      },
      extraData: JSON.stringify(commandData)
    };

    return new Promise<void>((resolve, reject) => {
      httpRequest.request(url, options, (err: BusinessError, data: http.HttpResponse) => {
        if (err) {
          reject(new Error(`请求失败: ${JSON.stringify(err)}`));
          httpRequest.destroy();
          return;
        }

        if (data.responseCode === 200) {
          console.log('命令发送成功');
          resolve();
        } else {
          reject(new Error(`命令发送失败: ${data.responseCode}`));
        }

        httpRequest.destroy();
      });
    });
  }

  // 查询设备属性
  async queryDeviceProperties(): Promise<DeviceData> {
    const httpRequest = http.createHttp();
    const url = `${this.baseUrl}/${this.projectId}/devices/${this.deviceId}/properties`;

    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json',
        'X-Auth-Token': this.accessToken
      }
    };

    return new Promise<DeviceData>((resolve, reject) => {
      httpRequest.request(url, options, (err: BusinessError, data: http.HttpResponse) => {
        if (err) {
          reject(new Error(`请求失败: ${JSON.stringify(err)}`));
          httpRequest.destroy();
          return;
        }

        if (data.responseCode === 200) {
          try {
            const result: HuaweiCloudResponse = JSON.parse(data.result.toString());
            let deviceData: DeviceData;

            if (result.services && result.services.length > 0) {
              const agricultureService = result.services.find((service: ServiceItem) => service.service_id === 'Agriculture');
              if (agricultureService) {
                deviceData = {
                  temperature: agricultureService.properties.temperature || 25,
                  humidity: agricultureService.properties.humidity || 60,
                  lightIntensity: agricultureService.properties.lightIntensity || 500,
                  waterPump: agricultureService.properties.waterPump || false
                };
              } else {
                deviceData = {
                  temperature: 25,
                  humidity: 60,
                  lightIntensity: 500,
                  waterPump: false
                };
              }
            } else if (result.properties) {
              deviceData = {
                temperature: result.properties.temperature || 25,
                humidity: result.properties.humidity || 60,
                lightIntensity: result.properties.lightIntensity || 500,
                waterPump: result.properties.waterPump || false
              };
            } else {
              deviceData = {
                temperature: 25,
                humidity: 60,
                lightIntensity: 500,
                waterPump: false
              };
            }

            resolve(deviceData);
          } catch (parseError) {
            reject(new Error(`解析响应数据失败: ${parseError}`));
          }
        } else {
          reject(new Error(`查询设备属性失败: ${data.responseCode}`));
        }

        httpRequest.destroy();
      });
    });
  }
}