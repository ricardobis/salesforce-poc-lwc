import { LightningElement, wire, api } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import images from '@salesforce/resourceUrl/images';
import getProductAPI from '@salesforce/apex/ProductInfoController.getProductAPI';


export default class ListProductInfo extends LightningElement {
    @api recordId;
    productList = [];

    imagesList = [
        { key: 'maquininha', url: `${images}/maquininha.jpg`, name: 'Maquininha' },
        { key: 'cartao', url: `${images}/cartao.jpg`, name: 'Cartao' },
    ];
    
    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name', 'Account.Website'] })
    account;

    getProducts() {
        getProductAPI({accountId: this.recordId})
        .then(result => {
            this.productList = result;
            this.productList = this.productList.map(product => {
                return {
                    ...product,
                    productImage: this.imagesList.find(image => image.key === product.productImageCode).url
                }
            });
        })
        .catch(error => {
            console.error('error', error);
        });
    }

    get name() {
        return this.account.data.fields.Name.value;
    }

    get website() {
        return this.account.data.fields.Website.value;
    }
}