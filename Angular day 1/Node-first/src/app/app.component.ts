import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title:any = null

  constructor(private http: HttpClient) {
      
  }

  get() {
    this.http.get('http://localhost:85/user/user2').subscribe((resp) => {
      this.title = resp
    }, error => console.log(error))
  }
  
}
