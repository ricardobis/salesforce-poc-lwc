public with sharing class ProductInfoController {
    @AuraEnabled(cacheable=true)
    public static List<ProductInfoTO> getProductAPI(String accountId){
        List<ProductInfoTO> productInfoList = new List<ProductInfoTO>();
        Account account = AccountDAO.getAccount(accountId)[0];
        
        ProductInfoTO productInfo = new ProductInfoTO();
        productInfo.productId = accountId;
        productInfo.productName = 'Product 1';
        productInfo.productImageCode = 'maquininha';
        productInfo.accountName = account.Name;
        productInfo.accountWebsite = account.Website;
        productInfoList.add(productInfo);
        
        productInfo = new ProductInfoTO();
        productInfo.productId = accountId;
        productInfo.productName = 'Product 2';
        productInfo.productImageCode = 'cartao';
        productInfo.accountName = account.Name;
        productInfo.accountWebsite = account.Website;
        productInfoList.add(productInfo);

        productInfo = new ProductInfoTO();
        productInfo.productId = accountId;
        productInfo.productName = 'Product 3';
        productInfo.productImageCode = 'cartao';
        productInfo.accountName = account.Name;
        productInfo.accountWebsite = account.Website;
        productInfoList.add(productInfo);
        
        return productInfoList;       
    }
    
    public class ProductInfoTO {
        @AuraEnabled
        public String productId;
        @AuraEnabled
        public String productName;
        @AuraEnabled
        public String productImageCode;
        @AuraEnabled
        public String accountName;
        @AuraEnabled
        public String accountWebsite;
    }
}