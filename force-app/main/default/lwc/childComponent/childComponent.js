import { LightningElement,track,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @track message;
    @api childMethod(strString){
        this.message = strString.toUpperCase();
    }
}