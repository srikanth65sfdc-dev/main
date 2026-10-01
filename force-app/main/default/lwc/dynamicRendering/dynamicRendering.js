import { LightningElement,wire,track } from 'lwc';
import getAccountData from '@salesforce/apex/accountDataInDataTableLwc.getAccountData';
export default class DynamicRendering extends LightningElement {
@track accounts = [];
    @track filteredAccounts = [];

    @wire(getAccountData)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
           // this.filterAccounts();
        } /*else if (error) {
            console.error(error);
        }*/
    }

    filterAccounts() {
        // Exclude accounts with industry 'Agriculture'
        this.filteredAccounts = this.accounts.filter(account => account.Industry !== 'Agriculture');
    }
    
    handleFilter() {
        this.filterAccounts();
    }
}