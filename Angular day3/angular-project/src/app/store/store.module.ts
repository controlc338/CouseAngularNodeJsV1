import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StoreRoutingModule } from './store-routing.module';
import { StoreComponent } from './store.component';
import { BuyComponent } from './buy/buy.component';

import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: 'buy',
    loadChildren: () => import('./buy/buy.module').then(m => m.BuyModule)
  },
];

@NgModule({
  declarations: [StoreComponent],
  imports: [
    CommonModule,
    StoreRoutingModule,
    RouterModule.forRoot(routes)
  ]
})
export class StoreModule { }
