"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
exports.__esModule = true;
exports.AppComponent = void 0;
var core_1 = require("@angular/core");
var AppComponent = /** @class */ (function () {
    function AppComponent(service, http) {
        this.service = service;
        this.http = http;
        this.title = 'angular-project';
        this.elementType = "svg";
        this.format = "CODE128";
        this.lineColor = "#000000";
        this.width = 1.5;
        this.height = 50;
        this.displayValue = true;
        this.fontOptions = "";
        this.font = "monospace";
        this.textAlign = "center";
        this.textPosition = "bottom";
        this.textMargin = 2;
        this.fontSize = 20;
        this.background = "#ffffff";
        this.margin = 10;
        this.marginTop = 10;
        this.marginBottom = 10;
        this.marginLeft = 10;
        this.marginRight = 10;
        this.barcode = 'PT-123';
        this.message = '';
        localStorage.setItem('message', 'ssasdasd');
    }
    AppComponent.prototype.toChlid = function (value) {
        this.message = value;
        this.service.changeMessage(value);
    };
    AppComponent.prototype.image = function (item) {
        var file = item.target.files[0];
        console.log(file);
        var formData = new FormData();
        formData.append('file', file);
        this.http.post(this.service.configURl, formData);
    };
    AppComponent.prototype.messageFromChlid = function ($even) {
        this.messageFromChild = $even;
    };
    AppComponent = __decorate([
        core_1.Component({
            selector: 'app-root',
            templateUrl: './app.component.html',
            styleUrls: ['./app.component.css'],
            providers: []
        })
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
