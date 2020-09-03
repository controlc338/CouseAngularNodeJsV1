import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OneComponent } from './home/one/one.component';
import { TwoComponent } from './home/two/two.component';


const routes: Routes = [
  {path:'', component:OneComponent},
  {path:'two', component:TwoComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
