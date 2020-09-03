"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
exports.__esModule = true;
exports.HomeComponent = void 0;
var core_1 = require("@angular/core");
var animations_1 = require("@angular/animations");
var keys = {
    public: 'BL0AQWPUewYu69fazElPky9CC2JLSSa9bUbQvQMcafeUNhvIq9o2GtWadPQw3rrkORas5JUSgHRROuoNpSZG5Os',
    private: 'cw7ZOjZEfnU1GyL4T1OkeKdi6HJBwG1wj66X6bUdqis'
};
var HomeComponent = /** @class */ (function () {
    function HomeComponent(swPush, notificationService) {
        //localStorage.getItem('message')
        var _this = this;
        this.swPush = swPush;
        this.notificationService = notificationService;
        this.mystateVal = 'inactive';
        this.messageEvent = new core_1.EventEmitter();
        notificationService.currentMessage.subscribe(function (resp) {
            _this.messageService = resp;
        });
    }
    HomeComponent.prototype.sendMessge = function () {
        this.messageEvent.emit('Hellow');
    };
    HomeComponent.prototype.ngOnInit = function () {
    };
    HomeComponent.prototype.toggleTable = function () {
        this.mystateVal = this.mystateVal == 'active' ? 'inactive' : 'active';
    };
    HomeComponent.prototype.sendNotification = function () {
        var _this = this;
        if (this.swPush.isEnabled) {
            this.swPush.requestSubscription({
                serverPublicKey: keys.public
            }).then(function (resp) {
                _this.notificationService.sendNotification(resp)
                    .subscribe(function (resp) {
                    console.log(resp);
                }, function (err) { return console.log(err); });
            });
        }
    };
    __decorate([
        core_1.Input()
    ], HomeComponent.prototype, "messageFromparent");
    __decorate([
        core_1.Output()
    ], HomeComponent.prototype, "messageEvent");
    HomeComponent = __decorate([
        core_1.Component({
            selector: 'app-home',
            templateUrl: './home.component.html',
            styleUrls: ['./home.component.css'],
            animations: [
                animations_1.trigger('myTrigger', [
                    animations_1.state('inactive', animations_1.style({
                        display: 'none',
                        opacity: 0,
                        transform: 'translateX(-100%)'
                    })),
                    animations_1.state('active', animations_1.style({
                        display: 'table',
                        opacity: 1,
                        transform: 'translateX(0)'
                    })),
                    animations_1.transition('inactive => active', animations_1.animate('200ms ease-in')),
                    animations_1.transition('active => inactive', animations_1.animate('500ms ease-out'))
                ])
            ]
        })
    ], HomeComponent);
    return HomeComponent;
}());
exports.HomeComponent = HomeComponent;
