import { LightningElement,track } from 'lwc';

export default class ParentComponentFirst extends LightningElement {
    @track msg;
    handleCustomEvent(event){
        const txtVal = event.detail;
        this.msg = txtVal;
    }
}