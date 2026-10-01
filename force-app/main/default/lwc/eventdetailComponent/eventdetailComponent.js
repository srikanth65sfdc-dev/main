import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Event_OBJECT from '@salesforce/schema/Event__c';
import NAME_FIELD from '@salesforce/schema/Event__c.Name';
import PeopleAttending_FIELD from '@salesforce/schema/Event__c.People_Attending__c';
import Location_FIELD from '@salesforce/schema/Event__c.Location__c';
export default class AccountCreator extends LightningElement {
    objectApiName = Event_OBJECT;
    fields = [NAME_FIELD,PeopleAttending_FIELD,Location_FIELD];
    handleSuccess(event){
        const toastEvent = new ShowToastEvent({
            title:"Event Creation Done",
            message:"Record Id : " + event.detail.id,
            variant:"success"
        });
        this.dispatchEvent(toastEvent)
    }
}