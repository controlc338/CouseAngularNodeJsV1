import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { HeaderComponent } from './layout/header/header.component';
import { FooterComponent } from './layout/footer/footer.component';
import { MenuComponent } from './layout/menu/menu.component';
import { HomeComponent } from './layout/home/home.component';
import { OneComponent } from './home/one/one.component';
import { TwoComponent } from './home/two/two.component';
import { LoginComponent } from './login/login.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthGuard} from './auth.guard';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogModule } from '@angular/material/dialog';
import { ModalNoteComponent } from './home/one/modal-note/modal-note.component';
import { ModalTagComponent } from './home/one/modal-tag/modal-tag.component';


const routes: Routes = [
  { path: '', redirectTo: 'note/login', pathMatch: 'full', },
  { path: 'note', redirectTo: 'note/login', pathMatch: 'full', },
  { path: 'note/note', component: OneComponent, canActivate: [AuthGuard] },
  { path: 'note/two', component: TwoComponent },
  { path: 'note/login', component: LoginComponent },

];

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    MenuComponent,
    HomeComponent,
    LoginComponent,
    OneComponent,
    TwoComponent,
    ModalNoteComponent,
    ModalTagComponent

  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(routes),
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    BrowserAnimationsModule,
    MatDialogModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
