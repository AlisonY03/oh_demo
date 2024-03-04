import router from '@ohos.router';
import { HttpTask } from '../http/HttpTask';
import { IHttpRequest } from '../http/IHttpRequest';
import { IResultListener } from '../http/IResultListener';
import { JsonHttpListener } from '../http/JsonHttpListener';
import { RequestModel, ResponseModel } from '../http/JsonHttpModel';
import { JsonHttpRequest } from '../http/JsonHttpRequest';
import { Friend, friendList } from '../model/FriendModel';
import { ItemView } from '../view/ItemComponent';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isShowProgress: boolean = false;
  private timeOutId: number = -1;


  build() {
    Column() {

      List(){
        ForEach(friendList, (friend:Friend)=>{
          ListItem(){
            ItemView({item:friend, test:(name:string) =>{
              if (name == "跳转") {
                this.jump()
              } else if (name == "网络请求"){
                this.startHttp("xxx")
              }
            }});
          }
        })

      }

      if (this.isShowProgress) {
        LoadingProgress()
          .color($r('app.color.loading_color'))
          .width($r('app.float.login_progress_size'))
          .height($r('app.float.login_progress_size'))
          .margin({ top: $r('app.float.login_progress_margin_top') })
      }
    }
    .padding({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '12' })

  }


  jump(): void {
    this.isShowProgress = true;
    if (this.timeOutId === -1) {
      this.timeOutId = setTimeout(() => {
        this.isShowProgress = false;
        this.timeOutId = -1;
        router.pushUrl({ url: 'pages/NextPage' });
      }, 1000);
    }
  }

  startHttp(s:string){
    let url: string = "https://v.juhe.cn/historyWeather/citys";
    let requestParams: RequestModel = {
      province_id: '2',
      key: 'bb52107206585ab074f5e59a8c73875b'
    };

    let iHttpRequest: IHttpRequest = new JsonHttpRequest();
    let resultListener : ResultListener = new ResultListener();

    let iHttpListener: JsonHttpListener<ResponseModel> = new JsonHttpListener<ResponseModel>(resultListener)
    let httpTask: HttpTask<RequestModel> = new HttpTask(url, requestParams, iHttpRequest, iHttpListener);
    httpTask.run();
  }
}


 class ResultListener implements IResultListener<ResponseModel>{
  onSuccess(t:ResponseModel){
  };

  onFailure(t:ResponseModel){

  }
}