import { IResultListener } from './IResultListener';
import { IHttpListener } from './IHttpListener';

export class JsonHttpListener<T> implements IHttpListener {
  private iResultListener: IResultListener<T>;

  constructor(iResultListener: IResultListener<T>) {
    this.iResultListener = iResultListener;
  }

  onSuccess(result: string) :void {
    let resultObj: T = JSON.parse(result);
    console.log("JsonHttpListener  result:"+result)
    console.log("JsonHttpListener  resultObj:"+resultObj)
    //结果交给调用者
    this.iResultListener.onSuccess(resultObj);
  }

  onFailure() {
    throw new Error('Method not implemented.');
  }
}