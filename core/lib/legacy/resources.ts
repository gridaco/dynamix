export enum AppPageUrls {
    Paycard = "paycard/",
    PaycardNew = "paycard/new",
    Wallet = "wallet/"
};

export enum AppActions {
    ShowToast = "showToast",
    ShowSnackbar = "showSnackbar",
    ShowShortDialog = "showShortDialog",
    ShowDetailedDialog = "showDetailedDialog",
    PushPage = "pushPage",
    PushNativePage = "pushNativePage",
    Dismiss = "dismiss",
    ShowWebDialog = "showWebDialog"
};

export enum WebBaseUrls {
    Production = "https://swingapp.io/",
    Test = "https://beta.d3hhagfrs76xcg.amplifyapp.com/"
};

export enum WebPageUrls {
    PassInfo = "pass/subscription-info-dialog",
    Rent = "rents",
    Pickup = "rents/pickup",
    Payment = "rents/new/payment",
    ManageScoot = "rents/manage/scoot",
    HelpReturning = "rents/help/return"
};

export const CardResources = {
    wallet: {
        color: "#FFEBB3",
        image: "https://swing-web.s3.ap-northeast-2.amazonaws.com/assets/wallet/wallet-card-changed.png"
    },
    pass: {
        color: "#E2E2E2",
        image: "https://swing-web.s3.ap-northeast-2.amazonaws.com/assets/wallet/wallet-pass-changed.png"
    },
    rent: {
        color: "#FFEBB3",
        image: "https://swing-web.s3.ap-northeast-2.amazonaws.com/assets/wallet/wallet-rents-changed.png"
    }
};
