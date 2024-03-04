import App from '@system.app'

@Entry
@Component
struct NextPage {
  build() {

    Column(){
      Text("NextPage").fontSize($r('app.float.next_page_font_size'))
    }

  }
}