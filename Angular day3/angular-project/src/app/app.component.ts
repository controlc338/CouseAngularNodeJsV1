import { Component } from '@angular/core';
import { NotficationService } from './notfication.service';
import { HttpClient } from '@angular/common/http'
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: []
})
export class AppComponent {
  title = 'angular-project';



  elementType = "svg";
  format = "CODE128";
  lineColor = "#000000";
  width = 1.5;
  height = 50;
  displayValue = true;
  fontOptions = "";
  font = "monospace";
  textAlign = "center";
  textPosition = "bottom";
  textMargin = 2;
  fontSize = 20;
  background = "#ffffff";
  margin = 10;
  marginTop = 10;
  marginBottom = 10;
  marginLeft = 10;
  marginRight = 10;

  barcode: string = 'PT-123'


  constructor(private service: NotficationService,
    private http: HttpClient) {
    localStorage.setItem('message', 'ssasdasd');
    
  }

  message: string = '';

  messageFromChild: string

  toChlid(value) {
    this.message = value;

    this.service.changeMessage(value)
  }

  image(item) {

    let file = item.target.files[0]
    console.log(file)

    let formData = new FormData();
    formData.append('file', file)

    this.http.post(this.service.configURl, formData)
  }


  messageFromChlid($even) {
    this.messageFromChild = $even
  }

}
