export  class UserBean{
  username?:string=""
  nickname?:string=""
  password?:string=""
  email?:string=""
  phone?:string=""
  constructor(username?:string,nickname?:string,password?:string,email?:string,phone?:string) {
    this.username=username
    this.nickname=nickname
    this.password=password
    this.email=email
    this.phone=phone
  }
}