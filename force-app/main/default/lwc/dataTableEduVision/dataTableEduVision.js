import { LightningElement,track } from 'lwc';
import getAccountData from '@salesforce/apex/accountDataInDataTableLwc.getAccountData';
export default class DataTableEduVision extends LightningElement {
     @track columndata =[
        {label : 'Name', fieldName :'Name', type : 'Text'},
        {label : 'Rating' , fieldName : 'Rating', type :'Text'},
        {label : 'Phone' , fieldName : 'Phone', type :'Text'},
        {label : 'Industry' , fieldName : 'Industry', type :'Text'},
];
}