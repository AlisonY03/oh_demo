export interface IHttpListener {
  onSuccess(result:string):void;
  onFailure():void;
}