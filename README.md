# The Movie Database (TMDb) iOS App with MVVM
This application developed without using a storyboard. The first window starts by AppDelegate window property. All api request runs with Service singleton pattern.

## Screenshots
| Main Screen      | Display Mode      | Details Screen      | Search Screen      | 
|:----------------:|:-----------------:|:-------------------:|:------------------:|
| ![main-screen][] | ![display-mode][] | ![details-screen][] | ![search-screen][] |

## Dependencies
App uses *[SDWebImage](https://github.com/SDWebImage/SDWebImage)* library for download and cache movie posters. SDWebImage provides an async image downloader with cache support.

## Api Links
**Api Link:** [https://developers.themoviedb.org/3](https://developers.themoviedb.org/3)

Search Query;
https://api.themoviedb.org/3/search/tv?api_key={api_key}&query=Marvel

Popular Movie;
https://api.themoviedb.org/3/tv/popular?api_key={api_key}&page=1

Movie Details;
https://api.themoviedb.org/3/tv/287947?api_key={api_key}

[main-screen]: https://github.com/perpeer/TheMovieDatabaseAPI/blob/main/previews/preview.gif?raw=true
[display-mode]: https://github.com/perpeer/TheMovieDatabaseAPI/blob/main/previews/home.png?raw=true
[details-screen]: https://github.com/perpeer/TheMovieDatabaseAPI/blob/main/previews/detail.png?raw=true
[search-screen]: https://github.com/perpeer/TheMovieDatabaseAPI/blob/main/previews/search.png?raw=true
