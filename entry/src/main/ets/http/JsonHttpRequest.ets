import { IHttpListener } from './IHttpListener';
import { IHttpRequest } from './IHttpRequest';
import http from '@ohos.net.http';


export class JsonHttpRequest implements IHttpRequest {
  private url: string = '';
  private params: string = '';
  private iHttpListener: IHttpListener;

  constructor() {

  }

  setUrl(url: string) {
    this.url = url;
  }

  setParams(params: string) {
    this.params = params;
    this.params = JSON.parse(this.params);
  }

  setListener(iHttpListener: IHttpListener) {
    this.iHttpListener = iHttpListener;
  }


  async execute(): Promise<void> {
    let httpRequest = http.createHttp();
    console.log('JsonHttpRequest: params:' + this.params);
    httpRequest.request(this.url, {
      method: http.RequestMethod.GET,
      extraData: this.params
    }, (err, data) => {
        if (!err) {
          // data.result为HTTP响应内容，可根据业务需要进行解析
          console.info('Result:' + JSON.stringify(data.result));
          console.info('code:' + JSON.stringify(data.responseCode));
          // data.header为HTTP响应头，可根据业务需要进行解析
          console.info('header:' + JSON.stringify(data.header));
          console.info('cookies:' + JSON.stringify(data.cookies)); // 8+

          //执行结果进行回调
          this.iHttpListener.onSuccess(data.result.toString());

          // 当该请求使用完毕时，调用destroy方法主动销毁
          httpRequest.destroy();
        } else {
          console.info('error:' + JSON.stringify(err));
          // 当该请求使用完毕时，调用destroy方法主动销毁
          httpRequest.destroy();
        }
      }
    );

  }
}















