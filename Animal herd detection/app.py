from flask import Flask, render_template
import folium
from geopy.geocoders import Nominatim
import random

app = Flask(__name__)

herd_locations = [
    {"name": "Cow Herd", "lat": 31.5204, "lon": 74.3587},  
    {"name": "Sheep Herd", "lat": 34.0151, "lon": 71.5249},  
]

@app.route("/")
def index():
    
    m = folium.Map(location=[31.5204, 74.3587], zoom_start=6)

    for herd in herd_locations:
        folium.Marker(
            location=[herd["lat"], herd["lon"]],
            popup=f"Animal Herd Detected: {herd['name']}",
            icon=folium.Icon(color="red")
        ).add_to(m)

    map_html = "templates/map.html"
    m.save(map_html)

    return render_template("map.html")

if __name__ == "__main__":
    app.run(debug=True)
