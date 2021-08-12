Local Native Image Build

```
sdk use java 21.1.0.r11-grl      
 
gu install native-image

./mvnw package -Pnative-image -DskipTests  
```

Docker Image Build

```
./mvnw spring-boot:build-image -Pnative-docker -DskipTests
```
