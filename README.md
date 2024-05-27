# Coding Challenge - Photos App

## Task

Create an iOS application that displays information retrieved from the network.

The server at the following URL responds with JSON formatted data representing a list of photo objects:

    (GET) https://jsonplaceholder.typicode.com/photos

The following URL returns a single entry for a given id:

    (GET) https://jsonplaceholder.typicode.com/photos/{id}

**Descrtiption:**
1. Retrieve the contents of the URL above
2. Parse and display the response in a list.
3. Tapping on an element in the list should navigate to a detail view.
4. The detail view should display the photo.
5. Add a Readme file and name two things you solved well in your opinion
and two things you would improve in a next step if you had more time.

## Solution

**Things I solved well:**
1. I have used the MVVM (Model View ViewModel) architecture to separate the development of the user-interface (View) from the business logic or back-end logic (Model) by introducing an intermediary abstraction (ViewModel) that manages the data and the state of the View.
2. I have used an `ImageLoader` class within the `AsyncImageView` to load images asynchronously from the network. This class is responsible for downloading images from the network and caching them in memory. It also provides a way to cancel the download task if the image is no longer needed. When used by the `OverviewView` the fetched image is **cached** and pending requests are **not cancelled** (e.g. when navigating to the `DetailView`). This is the case, since the user is most likely going to navigate back (to the `OverviewView`) where the image is then needed again. Thus caching and no cancelling here. However, when the `AsyncImageView` is used by the `DetailView`, the fetched image is **not cached** and pending requests are **cancelled** when the user navigates back to the `OverviewView` while the image is still loading. This is the case since the image is no longer needed and the images are larger than the thumbanail images used in the `OverviewView` (~5500 bytes compared to ~1200 bytes).

**Things I would improve:**
1. To maintain the priciple of single responsibility, the `OverviewView` should have been divided into seperate individual views which then only have one responsibility, or in other words, focus on one specific aspect of the user-interface (View). Therefore, a seperate `PhotoListView` (displayed when photo data is present), `LoadingView` (displayed when photo data is being fetched) and `ErrorView` (displayed when an error occured while fetching photo data) could have been created, such that the `OverviewView` wouldn't have to handle all three states. In the same manner, the logic from the `OverviewViewModel` could have been moved into a seperate `PhotoFetcher` class. Such that the `OverviewViewModel` would keep a reference to the `PhotoFetcher` to access it. This way when new features like a search bar to search for photos by title are added, a `SearchDelegate` or `PhotoSearcher` class could be added to the `OverviewViewModel` to handle the search logic.
2. Adding accessibility labels & identifiers to the UI elements to make the app more accessible to users with disabilities, as well as to UI testing. This would involve adding labels to the `OverviewView` and `DetailView` to describe the purpose of each element on the screen. This would make the app more usable for users who rely on screen readers or other assistive technologies to navigate the app.
