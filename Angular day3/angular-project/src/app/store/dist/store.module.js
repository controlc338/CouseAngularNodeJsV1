"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
exports.__esModule = true;
exports.StoreModule = void 0;
var core_1 = require("@angular/core");
var common_1 = require("@angular/common");
var store_routing_module_1 = require("./store-routing.module");
var store_component_1 = require("./store.component");
var router_1 = require("@angular/router");
var routes = [
    {
        path: 'buy',
        loadChildren: function () { return Promise.resolve().then(function () { return require('./buy/buy.module'); }).then(function (m) { return m.BuyModule; }); }
    },
];
var StoreModule = /** @class */ (function () {
    function StoreModule() {
    }
    StoreModule = __decorate([
        core_1.NgModule({
            declarations: [store_component_1.StoreComponent],
            imports: [
                common_1.CommonModule,
                store_routing_module_1.StoreRoutingModule,
                router_1.RouterModule.forRoot(routes)
            ]
        })
    ], StoreModule);
    return StoreModule;
}());
exports.StoreModule = StoreModule;
