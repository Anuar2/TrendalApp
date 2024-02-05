//
//  FontExtension.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import SwiftUI

public enum Fonts: String {
    
    case helveticaTitle = "Helvetica"
    case helveticaTitleBold = "Helvetica-Bold"
    case avenirNextRegular = "AvenirNext-Regular"
    case manropeRegular = "Manrope-Regular"
    case interRegular = "Inter-Regular"
    case interBold = "Inter-Bold"
    case interLight = "Inter-Light"
    case interMedium = "Inter-Medium"
    case montserratBold = "Montserrat-Bold"
    case sFProDisplay = "SF Pro Display"
    case montserratSemiBold = "Montserrat-SemiBold"
    case robotoMedium = "Roboto-Medium"
    
}

extension Font {
    static func custom(_ name: Fonts, size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
    
    //MARK: Catalog
    static var catalogTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: AvenirNext
    static var catalogCellTitleFont: Font {
        return .custom(.interMedium, size: 16)
    }
    
    //MARK: Profile
    static var profileCellTitleFont: Font {
        return .custom(.manropeRegular, size: 22)
    }
    static var profileNameCellTitleFont: Font {
        return .custom(.interMedium, size: 14)
    }
    static var profileNameDescrCellTitleFont: Font {
        return .custom(.interRegular, size: 12)
    }
    
    static var profileCellSubDescriptionTitleFont: Font {
        return .custom(.helveticaTitle, size: 13)
    }
    static var profileCellNavigationTitleFont: Font {
        return .custom(.helveticaTitle, size: 20)
    }
    
    
    //MARK: Registration
    static var registrationCellTitleFontBold: Font {
        return .custom(.interBold, size: 21)
    }
    
    static var registrationNameCellTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var registrationCellTitleFont: Font {
        return .custom(.interMedium, size: 16)
    }
    
    static var registrationCellSubDescriptionTitleFont: Font {
        return .custom(.interMedium, size: 14)
    }
    
    static var registrationCellDescriptionTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    
    //MARK: LockScreen
    static var profileNameTitleFont: Font {
        return .custom(.interRegular, size: 18).weight(.semibold)
    }
    
    static var profileNumberPhoneTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var profileDescriptionTitleFont: Font {
        return .custom(.helveticaTitle, size: 16)
    }
    
    static var digitalButtonsTitleFont: Font {
        return .custom(.helveticaTitle, size: 30)
    }
    
    //MARK: PinCodeScreen
    static var digitalNumbersTitleFont: Font {
        return .custom(.helveticaTitle, size: 22)
    }
    
    //MARK: Notification
    static var notificationCellDescriptionTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    static var notificationCellTitleFont: Font {
        return .custom(.interMedium, size: 14)
    }
    
    //MARK: Postcard
    static var postcardTitleFont: Font {
        return .custom(.helveticaTitle, size: 16)
    }
    
    static var postcardCellTitleFont: Font {
        return .custom(.interMedium, size: 16)
    }
    
    //MARK: Element of Card
    static var cardNameCellTitleFont: Font {
        return .custom(.interBold, size: 14)
    }
    
    static var cardNumberCellTitleFont: Font {
        return .custom(.interRegular, size: 14).weight(.semibold)
    }
    
    //MARK: Ticket
    static var ticketTitleFont: Font {
        return .custom(.interBold, size: 32)
    }
    
    static var ticketNameTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    static var ticketCostTitleFont: Font {
        return .custom(.interMedium, size: 16)
    }
    
    static var ticketStatusNameTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    static var ticketStatusCostTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: Navigation Panel
    
    static var navigationPanelTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    static var navigationPanelDescriptionTitleFont: Font {
        return .custom(.helveticaTitle, size: 14)
    }
    static var navigationPanelButtonTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: Order
    
    static var orderCellDescriptionTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var orderCellStatusTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var orderCellStatusDeliveryTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var orderCellNameTitleFont: Font {
        return .custom(.interBold, size: 14)
    }
    
    static var orderCellCostTitleFont: Font {
        return .custom(.interBold, size: 14)
    }
    
    //MARK: Cart
    static var cartIsEmptyTitleFont: Font {
        return .custom(.interBold, size: 21)
    }
    
    //MARK: RecomendedItemView
    static var storeItemTitleFont: Font {
        return .custom(.interBold, size: 14)
    }
    
    static var measureUnitTitle: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var storeItemCostTitleFont: Font {
        return .custom(.interBold, size: 14)
    }
    
    static var textForButtonFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: Payment link
    static var paymentLinkTitleFont: Font {
        return .custom(.interLight, size: 16)
    }
    
    //MARK: NewCardView (ForAnuar)
    static var paymentMethodTitleFont: Font {
        return .custom(.interBold, size: 14)
    }
    
    //MARK: AddressDetailView (ForAnuar)
    static var DefaultShippingAddressTitleFont: Font {
        return .custom(.helveticaTitleBold, size: 15)
    }
    
    //MARK: MainPageView
    static var mainTitleFont: Font {
        return .custom(.interBold, size: 21)
    }
    static var selectedCityTitleFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var selectedCityNavTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    static var categoryOfItemsTitleFont: Font {
        return .custom(.interBold, size: 16)
    }
    static var pagerTitleFont: Font {
        return .custom(.montserratBold, size: 20)
    }
    static var pagerOfDescriptionTitleFont: Font {
        return .custom(.montserratSemiBold, size: 11)
    }
    static var storeChoosingTitleFont: Font {
        return .custom(.sFProDisplay, size: 14).weight(.medium)
    }
    
    //MARK: TabBar
    static var tabarTitleFont: Font {
        return .custom(.sFProDisplay, size: 12).weight(.medium)
    }
    
    //MARK: DetailTextView
    static var titleDetailText: Font {
        return .custom(.interBold, size: 21)
    }
    
    static var priceDetailText: Font {
        return .custom(.interBold, size: 18)
    }
    
    static var realPriceDetailText: Font {
        return .custom(.interRegular, size: 12)
    }
    
    //MARK: CartButton
    static var numberOfProductsFont: Font {
        return .custom(.sFProDisplay, size: 12)
    }
    
    //MARK: SoringSelectBottomSheetView
    static var sortingSelectSheetTitle: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: FlowerDetailView
    static var infoTextFont: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var serviceDetailView: Font {
        return .custom(.interMedium, size: 16).weight(.semibold)
    }
    
    static var qualityDetailView: Font {
        return .custom(.interMedium, size: 12)
    }
    
    static var contentsDetailView: Font {
        return .custom(.interMedium, size: 16).weight(.semibold)
    }
    
    //MARK: DetailContentsView
    static var titleDetailContentsView: Font {
        return .custom(.interMedium, size: 14)
    }
    
    //MARK: sd
    static var titleSD: Font {
        return .custom(.interBold, size: 14)
    }
    
    static var textSD: Font {
        return .custom(.interMedium, size: 12)
    }
    
    //MARK: AddOnsItemView
    static var titleAddOnsItemView: Font {
        return .custom(.interBold, size: 14)
    }
    
    static var textAddOnsItemView: Font {
        return .custom(.interMedium, size: 12)
    }
    
    //MARK: ProductDetailVew
    static var realPriceCurrencFont: Font {
        return .custom(.interLight, size: 12)
    }
    
    //MARK: AddressView
    static var titleAddressViewFont: Font {
        return .custom(.interBold, size: 21)
    }
    
    static var addtextAddressViewFont: Font {
        return .custom(.interLight, size: 12)
    }
    
    //MARK: AddressListItem
    static var textAddressListItem: Font {
        return .custom(.interMedium, size: 12)
    }
    
    //MARK: CategoryButton
    static var categoryNameFont: Font {
        return .custom(.interMedium, size: 14)
    }
    
    //MARK: CustomNavigationOrderView
    static var titleCustomNavigationOrderView: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: CheckoutPickerView
    static var namePickerFont: Font{
        return .custom(.robotoMedium, size: 14)
    }
    
    //MARK: GeolocationView
    static var textGeolocationFont: Font{
        return .custom(.interMedium, size: 14)
    }
    
    //MARK: ButtonForNavigation
    static var nameNavigationFont: Font {
        return .custom(.interMedium, size: 14)
    }
    
    static var fontForImage: Font{
        return Font.system(size: 16, weight: .semibold)
    }
    
    //MARK: Checkout
    static var titelsCheckoutFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: TextFieldInfoView
    static var nameTextFieldFont: Font{
        return .custom(.interMedium, size: 12)
    }
    
    //MARK: OrderPrice
    static var orderPriceFont: Font{
        return .custom(.interMedium, size: 14)
    }
    
    //MARK: TimeChoiceView
    static var timeButtonTextFont: Font{
        return .custom(.interMedium, size: 16)
    }
    
    //MARK: CartView
    static var buttonCartViewFont: Font{
        return .custom(.interBold, size: 16)
    }
    
    //MARK: ProfileHistoryView
    static var textProfileHistoryViewFont: Font{
        return .custom(.interMedium, size: 12)
    }
    
    //MARK: ErrorWindowView
    static var titleErrorWindowFont: Font{
        return .custom(.interBold, size: 21)
    }
    
    static var descriptionErrorWindowFont: Font{
        return .custom(.interMedium, size: 16)
    }
    
    // MARK: ButtonRetry
    static var textButtonRetry: Font{
        return .custom(.interBold, size: 16)
    }
    
    //MARK: NotificationView
    static var textNotificationView: Font{
        return .custom(.interMedium, size: 14)
    }
    
    //MARK: OnboardingView
    static var titleOnboardingFont: Font {
        return .custom(.interBold, size: 28)
    }
    
    static var textOnboardingFont: Font {
        return .custom(.interLight, size: 16)
    }
    
    //MARK: OnboardingTextButton
    static var textButtonForFlower: Font {
        return .custom(.interRegular, size: 18).weight(.medium)
    }
    
    static var textSkipFont: Font {
        return .custom(.interBold, size: 16)
    }
    
    //MARK: CardHistoryView
    static var textCardHistoryView: Font{
        return .custom(.interBold, size: 16)
    }
}

