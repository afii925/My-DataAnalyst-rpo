import cv2
import numpy as np
import torch
from ultralytics import YOLO

model = YOLO("yolov8n.pt")  

CLASSES = model.names

ANIMALS = {"cow", "horse", "sheep", "deer", "dog", "cat"}

def detect_animals(image_path):
    image = cv2.imread(image_path)
    results = model(image)

    detected_animals = []
    
    for result in results:
        for box in result.boxes:
            class_id = int(box.cls)
            label = CLASSES[class_id]
            
            if label in ANIMALS:  
                x1, y1, x2, y2 = map(int, box.xyxy[0]) 
                confidence = box.conf.item()

                detected_animals.append((label, confidence, (x1, y1, x2, y2)))

                cv2.rectangle(image, (x1, y1), (x2, y2), (0, 255, 0), 2)
                cv2.putText(image, f"{label} {confidence:.2f}", (x1, y1 - 10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

    cv2.imwrite("detected_output.jpg", image)
    cv2.imshow("Animal Detection", image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    return detected_animals

if __name__ == "__main__":
    image_path = r"C:\Users\AFZAAL MUSTAFA\Desktop\PAI LAB TASKS\cow pic.jpg" 
    detected = detect_animals(image_path)
    print("Detected Animals:", detected)
