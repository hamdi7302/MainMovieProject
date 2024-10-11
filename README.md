# MainMovieProject

## Overview
**MainMovieProject** is an iOS application that allows users to discover and view the latest movies and TV series. The app is designed using **Clean Architecture with MVVM** (Model-View-ViewModel) pattern and leverages **Use Cases** to encapsulate business logic. The application retrieves data from [TMDb (The Movie Database)](https://www.themoviedb.org/) via their API.

## Features
- **Trending Movies and Series**: Display the most popular movies and TV shows.
- **Detailed Information**: View specific details about each movie or series, including release date, ratings, and descriptions.
- **Search**: Look up movies or series by title.
- **User-Friendly Interface**: Responsive design, adaptable to different screen sizes.

## Architecture

The application is built using **Clean Architecture with MVVM**, separating different concerns to ensure maintainability and scalability. This approach promotes a clear structure that allows easy testing and extensibility.

### Layers of Architecture:
1. **Presentation Layer (MVVM)**:
   - **Model**: Represents the data.
   - **View**: Displays data and responds to user interactions.
   - **ViewModel**: Acts as a mediator between the View and the business logic. It transforms and prepares data for the View, observing changes in real-time using **Combine**.
   
2. **Domain Layer (Use Cases)**:
   - Use Cases encapsulate the core business logic. Each Use Case performs a single task, such as fetching trending movies or searching for titles

3. **Data Layer (Repository)**:
   - Responsible for data management and API calls.
   - The **Repository** interacts with the TMDb API to fetch data and returns it to the Use Cases. It uses **Combine** to manage asynchronous data flows.

### Sessions with Combine
**Combine** is integrated for managing reactive data streams, especially handling asynchronous network calls via **URLSession** or **Alamofire**. **Publishers** emit values over time, and **Subscribers** handle those values or potential errors.

#### Data Flow with Combine:
1. The **ViewModel** triggers a **Use Case**.
2. The **Use Case** calls the **Repository** to fetch data from the TMDb API.
3. **Combine** streams the data from the API asynchronously.
4. The **ViewModel** receives the data, processes it, and updates the View.

This makes the app reactive and responsive to user actions while keeping network handling clean and decoupled.

## Technologies
- **Swift**: Core development language.
- **Clean Architecture with MVVM**: Ensures a clean separation of concerns, scalability, and testability.
- **Combine**: Manages async data flows and sessions.
- **Package netwoekingLayer**: For networking and API requests.
- **TMDb API**: Used to fetch movie and TV series data.
- **SwiftUI/UIKit**: Depending on your choice for building the user interface.
