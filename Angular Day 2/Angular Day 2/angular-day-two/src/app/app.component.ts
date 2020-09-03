import { Component } from '@angular/core';
import {CookieTime, CookieTime2} from './cookieTime'
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements CookieTime{

  name: string;
  callName(): void {
    
  }
  cookieTime2:CookieTime2

  textOneWay = 'Party'

  title = 'angular-day-two';
  
  print(){
    this.cookieTime2 = {name:'name', lastname:'123'}
    this.cookieTime2.name = 'asdasd'
    console.log(this.cookieTime2.name)
    console.log(this.print3())

    let myAdd: (x: number, y: number) => number = function (
      x: number,
      y: number
    ): number {
      return x + y;
    };

    myAdd(1,2)
  }

  print2():string[]{

    return []
  }

  print3():{name:string, last:string}{
    return {name:'name',last:'test'}


    
  }

  testEven(){

    console.log(this.textOneWay)
  }


  //experimentalDecorators
  
}
