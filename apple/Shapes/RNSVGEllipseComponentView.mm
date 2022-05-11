#import "RNSVGEllipseComponentView.h"
#import "RNSVGEllipse.h"
#import "RNSVGFabricConversions.h"

#import <react/renderer/components/rnsvg/ComponentDescriptors.h>
#import "RCTFabricComponentsPlugins.h"
#import "RCTConversions.h"
#import <react/renderer/components/view/conversions.h>

using namespace facebook::react;

@implementation RNSVGEllipseComponentView {
    RNSVGEllipse *_element;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RNSVGEllipseProps>();
    _props = defaultProps;
    _element = [[RNSVGEllipse alloc] init];
    self.contentView = _element;
  }
  return self;
}

#pragma mark - RCTComponentViewProtocol

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RNSVGEllipseComponentDescriptor>();
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &newProps = *std::static_pointer_cast<const RNSVGEllipseProps>(props);

    _element.cx = [RNSVGLength lengthWithString:RCTNSStringFromString(newProps.cx)];
    _element.cy = [RNSVGLength lengthWithString:RCTNSStringFromString(newProps.cy)];
    _element.rx  = [RNSVGLength lengthWithString:RCTNSStringFromString(newProps.rx)];
    _element.ry  = [RNSVGLength lengthWithString:RCTNSStringFromString(newProps.ry)];
    setCommonRenderableProps(newProps, _element);
    [super updateProps:props oldProps:oldProps];
}

- (void)prepareForRecycle
{
    [super prepareForRecycle];
    _element = [[RNSVGEllipse alloc] init];
    self.contentView = _element;
}

@end

Class<RCTComponentViewProtocol> RNSVGEllipseCls(void)
{
  return RNSVGEllipseComponentView.class;
}