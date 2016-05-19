//
//  AvatarView.m
//  Avatar 3D
//
//  Created by Projet 2A on 18/05/2016.
//  Copyright © 2016 Projet 2A. All rights reserved.
//

#import "AvatarView.h"

@implementation AvatarView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    
    NSString *urlPath = [[NSBundle mainBundle] pathForResource:@"head" ofType:@"obj"];
    NSURL *url = [NSURL fileURLWithPath:urlPath];
    
    MDLAsset *asset = [[MDLAsset alloc] initWithURL:url];
    MDLObject *head = [asset objectAtIndex:0];
    
    SCNScene *scene = [SCNScene scene];
    self.scene = scene;
    
    SCNNode *node = [SCNNode nodeWithMDLObject:head];
    
    [scene.rootNode addChildNode:node];

    // The spot light is positioned right next to the camera
    // so it is offset sligthly and added to the camera node
    SCNLight *spotLight = [SCNLight light];
    spotLight.type = SCNLightTypeDirectional;
    spotLight.color = [NSColor grayColor];
    SCNNode *spotLightNode = [SCNNode node];
    spotLightNode.light = spotLight;
    spotLightNode.position = SCNVector3Make(-2, 2, 2);
    
    [scene.rootNode addChildNode:spotLightNode];
    

    // Create a rotation transform for when the box is rotated halfway around
    // the x,y-diagonal. Make the animation linear and repeat it to give the
    // illusion of it being a continuous rotation
/*    CABasicAnimation *boxRotation = [CABasicAnimation animationWithKeyPath:@"transform"];
    boxRotation.toValue =
    [NSValue valueWithCATransform3D:CATransform3DRotate(node.transform,
                                                        M_PI,
                                                        0, 1, 0)];
    boxRotation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    boxRotation.repeatCount = INFINITY;
    boxRotation.duration = 5.0;
    
    [node addAnimation:boxRotation
                   forKey:@"RotateTheBox"];
*/    
}

@end
