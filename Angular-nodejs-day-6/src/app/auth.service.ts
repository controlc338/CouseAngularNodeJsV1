import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private url = 'http://localhost:60';

  private logined: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);

  // tslint:disable-next-line: typedef
  get geturl() {
    return this.url;
  }

  // tslint:disable-next-line: typedef
  get isLogin() {
    return this.logined.asObservable();
  }

   // tslint:disable-next-line: typedef
   setIsLogin(value) {
    this.logined.next(true);
  }

  constructor(private http: HttpClient, private router: Router) {

  }

  // tslint:disable-next-line: typedef
  getHeadersAut() {
    const headersAut = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        Authorization: localStorage.getItem('token'),
      }),
    };
    return headersAut;
  }


  login(user): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.post(this.geturl + '/login', user)
        .subscribe((resp: any) => {
          if (resp.message == 'success') {
            this.logined.next(true);
            this.router.navigate(['/note/note']);
            localStorage.setItem('token', resp.token);
          }
          resolve(resp);
        }, err => reject(err));
    });
  }


  findBykeyworld(keyword: string): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.get(`${this.geturl}/note/note/${keyword}`, this.getHeadersAut())
        .subscribe((resp: any) => {
          resolve(resp);
      }, err => reject(err));
    });
  }

  saveNote(note): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.post(this.geturl + '/note/note', note, this.getHeadersAut())
        .subscribe((resp: any) => {
          resolve(resp);
        }, err => reject(err));
    });
  }

  getNote(): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.get(this.geturl + '/note/findAll', this.getHeadersAut())
        .subscribe((resp: any) => {
          resolve(resp);
      }, err => reject(err));
    });
  }

  updateNote(body, id): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.put(`${this.geturl}/note/note/${id}`, body, this.getHeadersAut())
      .subscribe(resp => resolve(resp), err => reject(err));
    });
  }

  deleteNote(id: number): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.delete(`${this.geturl}/note/note/${id}`, this.getHeadersAut())
      .subscribe(resp => resolve(resp), err => reject(err));
    });
  }

  saveTag(body: object): Promise<any>{
    return new Promise((resolve, reject) => {
        this.http.post(`${this.geturl}/tag/`, body, this.getHeadersAut())
        .subscribe(resp => resolve(resp), error => reject(error));
    });
  }

  updateTag(body: object, id: number): Promise<any>{
    return new Promise((resolve, reject) => {
      this.http.put(`${this.geturl}/tag/${id}`, body, this.getHeadersAut())
      .subscribe(resp => resolve(resp), error => reject(error));
    });
  }

  deleteTag(id: number): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.delete(`${this.geturl}/tag/${id}`, this.getHeadersAut())
      .subscribe(resp => resolve(resp), error => reject(error));
    });
  }

}
