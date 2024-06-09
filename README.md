Created two screens that similate the UI Given, using SwiftUI and SwiftData for data persistance, added unit and UI testing. 
<img width="826" alt="Screenshot 2024-04-15 at 1 29 09 AM" src="https://github.com/marlhex/Lululemon_SwiftData/assets/4165637/cdc94c1e-e218-473c-bf7b-9a8beed83ed9">

# Lululemon App

The Lululemon App is designed to manage a collection of garments. It allows users to add, list, and sort garments either alphabetically or by creation time. This app leverages SwiftUI and SwiftData for an effective and efficient user experience.

## Features

- **Add Garments**: Add new garment entries with a name and auto-generated creation timestamp.
- **Display Garments**: View a list of added garments.
- **Sort Garments**: Sort garments alphabetically or by creation time.
- **Responsive UI**: Animations and loaders provide visual feedback during data operations.

## Architecture

The app is built using the MVVM architecture pattern to ensure a clear separation of concerns and to facilitate easier maintenance and scalability.

### Components

- **Model**: Represents the data structure.
- **View**: UI components for user interaction.
- **ViewModel**: Manages the data for the View.

### Flow Diagram

```mermaid
graph TD;
    A[Start] --> B{User Opens App}
    B --> C[List Garments View]
    C -->|Add Button| D[Add Garment View]
    D -->|Save| E[Insert into SwiftData]
    E --> C
    C -->|Select Sort Option| F[Apply Sort]
    F --> C
