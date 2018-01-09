/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Methods on the main view controller for handling virtual object loading and movement
*/

import UIKit
import SceneKit

@available(iOS 11.0, *)
extension ARView {
    /**
     Adds the specified virtual object to the scene, placed using
     the focus square's estimate of the world-space position
     currently corresponding to the center of the screen.
     
     - Tag: PlaceVirtualObject
     */
    func placeVirtualObject(_ virtualObject: VirtualObject) {
        guard let cameraTransform = session.currentFrame?.camera.transform,
            let focusSquarePosition = focusSquare.lastPosition else {
//            statusViewController.showMessage("CANNOT PLACE OBJECT\nTry moving left or right.")
            return
        }
        
        virtualObjectInteraction.selectedObject = virtualObject
        virtualObject.setPosition(focusSquarePosition, relativeTo: cameraTransform, smoothMovement: false)
        
        updateQueue.async {
            self.sceneView.scene.rootNode.addChildNode(virtualObject)
        }
    }
    
    // MARK: - VirtualObjectSelectionViewControllerDelegate
    
//    func virtualObjectSelectionViewController(_: VirtualObjectSelectionViewController, didSelectObject object: VirtualObject) {
//        virtualObjectLoader.loadVirtualObject(object, loadedHandler: { [unowned self] loadedObject in
//            DispatchQueue.main.async {
//                self.hideObjectLoadingUI()
//                self.placeVirtualObject(loadedObject)
//            }
//        })
//
//        displayObjectLoadingUI()
//    }
//
//    func virtualObjectSelectionViewController(_: VirtualObjectSelectionViewController, didDeselectObject object: VirtualObject) {
//        guard let objectIndex = virtualObjectLoader.loadedObjects.index(of: object) else {
//            fatalError("Programmer error: Failed to lookup virtual object in scene.")
//        }
//        virtualObjectLoader.removeVirtualObject(at: objectIndex)
//    }
}
