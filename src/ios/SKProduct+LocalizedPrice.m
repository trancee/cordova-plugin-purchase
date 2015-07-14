#import "SKProduct+LocalizedPrice.h"

@implementation SKProduct (LocalizedPrice)

- (NSString *)localizedPrice
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:self.priceLocale];
    NSString *formattedString = [numberFormatter stringFromNumber:self.price];
#if ARC_DISABLED
    [numberFormatter release];
#endif
    return formattedString;
}

- (NSString *)currencyCode
{
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	[formatter setLocale:self.priceLocale];
	NSString *currencyString = [formatter stringFromNumber:self.price];
	NSString *currencyCode = [formatter currencyCode];
#if ARC_DISABLED
	[formatter release];
#endif
	return currencyCode;
    // return [self.priceLocale objectForKey:NSLocaleCurrencyCode];
}

@end
