import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountHelper.getAccounts';


export default class AccountListLWC extends LightningElement {
@wire(getAccounts) accounts;
}