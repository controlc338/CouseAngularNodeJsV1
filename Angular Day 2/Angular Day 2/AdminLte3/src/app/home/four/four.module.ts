import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FourComponent} from './four.component'


@NgModule({
  declarations: [FourComponent],
  imports: [
    CommonModule
  ],
  exports: [FourComponent]
})
export class FourModule { }
