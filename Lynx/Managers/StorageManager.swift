//
//  StorageManager.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit
import Combine

class StorageManager: ObservableObject {
    private let storage = Storage.storage()
    private let storageRef = Storage.storage().reference()
    
    // MARK: - Image Upload
    func uploadImage(_ image: UIImage, path: String) async throws -> String {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            throw StorageError.compressionFailed
        }
        
        let imageRef = storageRef.child(path)
        
        return try await withCheckedThrowingContinuation { continuation in
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            imageRef.putData(imageData, metadata: metadata) { metadata, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                imageRef.downloadURL { url, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }
                    
                    guard let downloadURL = url else {
                        continuation.resume(throwing: StorageError.downloadURLFailed)
                        return
                    }
                    
                    continuation.resume(returning: downloadURL.absoluteString)
                }
            }
        }
    }
    
    // MARK: - Image Download
    func downloadImage(from urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw StorageError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else {
            throw StorageError.invalidImageData
        }
        
        return image
    }
    
    // MARK: - Delete Image
    func deleteImage(at path: String) async throws {
        let imageRef = storageRef.child(path)
        try await imageRef.delete()
    }
    
    // MARK: - Generate Demo Images
    func generateDemoImageURL(for category: String) -> String {
        // Return placeholder image URLs for demo purposes
        let demoImages = [
            "Food & Beverages": "https://images.unsplash.com/photo-1504674900240-7747b97952ac?w=400&h=300&fit=crop",
            "Retail": "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=300&fit=crop",
            "Health & Beauty": "https://images.unsplash.com/photo-1559591935-c6c6b9e3a94d?w=400&h=300&fit=crop",
            "Sports & Outdoors": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop",
            "Technology": "https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop",
            "Automotive": "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop",
            "Home & Garden": "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop",
            "Entertainment": "https://images.unsplash.com/photo-1489599835382-67450f1c3d8b?w=400&h=300&fit=crop"
        ]
        
        return demoImages[category] ?? "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop"
    }
    
    func generateDemoCouponImageURL(for brand: String) -> String {
        // Return placeholder image URLs for demo purposes
        let demoImages = [
            "McDonald's": "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop",
            "Starbucks": "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400&h=300&fit=crop",
            "Walmart": "https://images.unsplash.com/photo-1607082349566-187342175e2f?w=400&h=300&fit=crop",
            "Target": "https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop",
            "Amazon": "https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?w=400&h=300&fit=crop",
            "Nike": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=300&fit=crop",
            "Apple": "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=400&h=300&fit=crop",
            "Samsung": "https://images.unsplash.com/photo-1610945415295-d609bb34245d?w=400&h=300&fit=crop"
        ]
        
        return demoImages[brand] ?? "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop"
    }
}

// MARK: - Storage Errors
enum StorageError: Error, LocalizedError {
    case compressionFailed
    case downloadURLFailed
    case invalidURL
    case invalidImageData
    
    var errorDescription: String? {
        switch self {
        case .compressionFailed:
            return "Failed to compress image"
        case .downloadURLFailed:
            return "Failed to get download URL"
        case .invalidURL:
            return "Invalid URL"
        case .invalidImageData:
            return "Invalid image data"
        }
    }
}
