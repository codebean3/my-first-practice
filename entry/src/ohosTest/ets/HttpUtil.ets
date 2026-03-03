import http from '@ohos.net.http';

class HttpUtil {
  private httpRequest: http.HttpRequest = http.createHttp();

  async get(url: string): Promise<string> {
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      connectTimeout: 60000,
      readTimeout: 60000,
    };

    try {
      let response = await this.httpRequest.request(url, options);
      if (response.responseCode === 200) {
        return response.result.toString();
      } else {
        return '';
      }
    } catch (err) {
      return '';
    }
  }

  async post(url: string, data: string): Promise<string> {
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      connectTimeout: 60000,
      readTimeout: 60000,
      extraData: data,
      header: {
        'Content-Type': 'application/json'
      }
    };

    try {
      let response = await this.httpRequest.request(url, options);
      if (response.responseCode === 200) {
        return response.result.toString();
      } else {
        return '';
      }
    } catch (err) {
      return '';
    }
  }

  destroy(): void {
    this.httpRequest.destroy();
  }
}

export let httpUtil = new HttpUtil();
// import { httpUtil } from '../utils/HttpUtil';
//
// let result = await httpUtil.get('https://api.example.com/data');
// if (result) {
//   let data = JSON.parse(result);
//   // 处理数据
// }