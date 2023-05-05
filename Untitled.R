library("tidyverse")
library("leaflet")
petmap <- Book5

# Define a custom icon
redIcon <- makeIcon(
  iconUrl = "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png",
  iconWidth = 25, iconHeight = 41,
  iconAnchorX = 12, iconAnchorY = 41,
  popupAnchorX = 1, popupAnchorY = -34
)

petmap %>% 
  leaflet() %>%
  addProviderTiles(providers$OpenStreetMap.Mapnik, group = "OpenStreetMap.Mapnik") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>%
  addLayersControl(baseGroups = c("Toner Lite", "OpenStreetMap.Mapnik")) %>%
  addMarkers(label = petmap$FoodBank,
             clusterOptions = markerClusterOptions(),
             popup = TRUE,
             icon = redIcon) %>%
  setView(lat = 52.4862 , lng = 1.8904, zoom = 6) 


petmap %>% 
  leaflet() %>%
  addProviderTiles(providers$OpenStreetMap.Mapnik, group = "OpenStreetMap.Mapnik") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>%
  addLayersControl(baseGroups = c("Toner Lite", "OpenStreetMap.Mapnik")) %>%
  addCircleMarkers(
    label = petmap$FoodBank,
    popup = TRUE,
    color = "#1380A1",
    fillColor = "#1380A1",
    radius = 7
  ) %>%
  setView(lat = 52.4862 , lng = 1.8904, zoom = 6)

petmap %>% 
  leaflet() %>%
  addProviderTiles(providers$OpenStreetMap.Mapnik, group = "OpenStreetMap.Mapnik") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>%
  addLayersControl(baseGroups = c("Toner Lite", "OpenStreetMap.Mapnik")) %>%
  addCircleMarkers(label = petmap$FoodBank,
                   popup = TRUE,
                   color = "#1380A1",
                   fillColor = "#1380A1",
                   radius = 5,
                   clusterOptions = markerClusterOptions(
                     maxClusterRadius = 45,
                     opacity = 0.7, # Set the opacity of the cluster markers
                     iconCreateFunction = JS(
                       "function(cluster) {
                         var childCount = cluster.getChildCount();
                         var scale = Math.min(1, childCount/10);
                         var radius = 55* scale;
                         return L.divIcon({
                           html: '<div style=\"background-color: #1380A1; border-radius: 60%; width: ' + radius + 'px; height: ' + radius + 'px; display: flex; align-items: center; justify-content: center; color: white; font-size: 9px; font-weight: bold;\">' + childCount + '</div>',
                           className: 'marker-cluster',
                           iconSize: L.point(radius, radius)
                         });
                       }"
                     )
                   )
  ) %>%
  setView(lat = 52.4862 , lng = 1.8904, zoom = 5)




























