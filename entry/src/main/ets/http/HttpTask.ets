import { IHttpListener } from './IHttpListener';
import { IHttpRequest } from './IHttpRequest';


export class HttpTask<T> {
  private iHttpRequest: IHttpRequest;
  private iHttpListener: IHttpListener;

  constructor(url: string, requestData: T, iHttpRequest: IHttpRequest, iHttpListener: IHttpListener) {
    this.iHttpRequest = iHttpRequest;
    this.iHttpListener = iHttpListener;
    this.iHttpRequest.setUrl(url);
    this.iHttpRequest.setListener(iHttpListener);

    if (requestData != null) {
      let requestParams:string=JSON.stringify(requestData);
      console.log("HttpTask:"+"  requestParams:"+requestParams);

      this.iHttpRequest.setParams(requestParams);
    }
  }

  //真实的网络请求
  async run(): Promise<void> {
    await this.iHttpRequest.execute();
  }
}

