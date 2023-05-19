<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/24/2023
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300&display=swap");

        * {
            margin: 0;
        }

        body {
            font-family: "Poppins", sans-serif;
            color: white;
        }

        .navbar {
            width: 100%;
            height: 50px;
            background-color: #151515;
        }

        .navbar-container {
            display: flex;
            align-items: center;
            padding: 0 50px;
            height: 100%;
            color: white;
        }

        .logo-container {
            flex: 1;
        }

        .logo {
            font-family: "Bebas Neue", cursive;
            font-size: 35px;
            letter-spacing: 5px;
            color: #6115ad;
        }

        .menu-container {
            flex: 6;
        }

        .menu-list {
            display: flex;
            list-style: none;
        }

        .menu-items {
            margin-right: 30px;
        }

        .profile-text-container {
            margin: 0 20px;
        }

        .toggle {
            width: 40px;
            height: 20px;
            background-color: white;
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: space-around;
            position: relative;
        }

        .toggle-icon {
            color: goldenrod;
            font-size: 12px;
        }

        .toggle-ball {
            width: 18px;
            height: 18px;
            background-color: black;
            position: absolute;
            right: 1px;
            border-radius: 50%;
            cursor: pointer;
            transition: 1s ease all;
        }

        .profile-pic {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            object-fit: cover;
            cursor: pointer;
        }

        .profile-container {
            flex: 2;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .sidebar {
            width: 50px;
            height: 100%;
            background-color: #151515;
            position: fixed;
            top: 0;
            display: flex;
            flex-direction: column;
            padding-top: 70px;
            align-items: center;
        }

        .left-menu-icon {
            color: white;
            font-size: 18px;
            margin-bottom: 40px;
            cursor: pointer;
        }

        .container {
            min-height: calc(100vh - 50px);
            background-color: #101820ff;
        }

        .content-container {
            margin-left: 50px;
        }

        .featured-content {
            height: 60vh;
            padding: 50px;
        }

        .featured-title {
            font-family: "Bebas Neue", cursive;
            font-size: 70px;
            color: white;
        }

        .featured-author {
            font-weight: 600;
        }

        .featured-text {
            width: 500px;
            color: lightgrey;
            margin: 30px 0;
        }

        .featured-hashtags {
            display: flex;
            list-style: none;
            padding: 0;
        }

        .hashs {
            margin: -10px 20px 30px 0;
            font-weight: 700;
            font-size: 14px;
            color: lightgrey;
        }


        .featured-button {
            background-color: #6115ad;
            color: white;
            align-items: center;
            font-size: 18px;
            padding: 15px 25px;
            border-radius: 10px;
            border: none;
            outline: none;
            cursor: pointer;
        }

        .save-later {
            font-size: 25px;
            padding-left: 25px;
        }

        .book-list-container {
            padding: 20px 50px;
        }

        .book-list-wrapper {
            position: relative;
            overflow: hidden;
        }

        .book-list {
            display: flex;
            align-items: center;
            height: 250px;
            transform: translateX(0);
            transition: all 1s ease-in-out;
        }

        .book-list-item {

            margin-right: 30px;
            position: relative;
        }

        .book-list-item:hover .book-list-item-img {
            transform: scale(1.2);
            margin: 0 20px;
            box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
            opacity: 0.3;

        }

        .book-list-item:hover .book-list-item-title,
        .book-list-item:hover .book-list-item-desc,
        .book-list-item:hover .button-class {
            opacity: 1;
        }

        .book-list-item-img {
            transition: all 1s ease-in-out;
            width: 270px;
            height: 200px;
            object-fit: cover;
            object-position: top;
            border-radius: 30px;

        }

        .book-list-item-title {
            padding: 0 10px;
            font-size: 20px;
            font-weight: 500;
            position: absolute;
            color: grey;
            top: 10%;
            left: 30px;
            opacity: 0;
            transition: 1s all ease-in-out;
        }

        .book-list-item-desc {
            padding: 0 10px;
            font-size: 11px;
            font-weight: 500;
            position: absolute;
            color: rgb(160, 160, 160);
            top: 30%;
            left: 30px;
            width: 200px;
            opacity: 0;
            transition: 1s all ease-in-out;
        }


        .button-class {
            padding: 0 10px;
            position: absolute;
            bottom: 30px;
            left: 30px;
            align-items: center;
            opacity: 0;
            transition: 1s all ease-in-out;
        }

        .book-list-item-button {

            background-color: #6115ad;
            color: white;
            align-items: center;
            font-size: 10px;
            padding: 10px;
            border-radius: 4px;
            border: none;
            outline: none;
            cursor: pointer;

        }

        .insider {
            font-size: 20px;
            padding-left: 25px;
            color: #6115ad;
            cursor: pointer;

        }


        .arrow {
            font-size: 90px;
            position: absolute;
            top: 80px;
            right: 0;
            color: lightslategray;
            opacity: .5;
            cursor: pointer;
        }


        .navbar-container.active {
            background-color: white;
            color: #151515;
        }

        .sidebar.active {
            background-color: white;
        }

        .left-menu-icon.active {
            color: #151515;
        }

        .toggle.active {
            background-color: #151515;
        }

        .toggle-ball.active {
            background-color: white;
            transform: translateX(-20px);
        }


        .container.active {
            background-color: white;
        }

        .book-list-title.active {
            color: #151515;
        }


        @media only screen and (max-width: 940px) {
            .menu-container {
                display: none;
            }
        }
    </style>
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">--%>
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/#[[latestVersion]]#/mdb.min.css"
            rel="stylesheet"
    />
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/#[[latestVersion]]#/mdb.min.js"
    ></script>
    <title>CREAD - Thế giới sách kỳ diệu, có một không hai, xem hoài không chán</title>
</head>
<body>
<div class="navbar">
    <div class="navbar-container">
        <div class="logo-container"><h1 class="logo">CREAD</h1></div>
        <div class="menu-container">
            <ul class="menu-list">
                <li class="menu-items">New</li>
                <li class="menu-items">Subgenre</li>
                <li class="menu-items">My Books</li>
                <li class="menu-items">Browse</li>
                <li class="menu-items">Community</li>
            </ul>
        </div>
        <div class="profile-container">
            <div class="btn-group shadow-0 " role="group" aria-label="Basic example">
                <c:choose>
                    <c:when test="${sessionScope['user'] == null}">
                        <a href="/users?action=signup">
                            <button type="button" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
                                    style="background-color: #151515; border: 2px solid white; border-radius: 7px; color: white; cursor: pointer">Đăng ký
                            </button>
                        </a>
                        <a href="/users?action=login">
                            <button type="button" class="btn btn-primary"
                                    style="background-color: #151515; border: 2px solid white; border-radius: 7px; color: white; cursor: pointer">Đăng nhập
                            </button>
                        </a>
                    </c:when>
                    <c:otherwise>
<%--                        <c:set value="${'user.avatar'}" scope="request" var="avatar"></c:set>--%>
                        <img class="profile-pic"
                             src="${sessionScope["avatar"]}">
<%--                        <img class="profile-pic"--%>
<%--                             src="https://images.unsplash.com/photo-1489939078242-0a1dc4a08f06?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80">--%>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="profile-text-container">
                <i class="fas fa-caret-down"></i>
            </div>
            <div class="toggle">
                <i class="fas fa-moon toggle-icon"></i>
                <i class="fas fa-sun toggle-icon"></i>
                <div class="toggle-ball"></div>
            </div>
        </div>
    </div>
</div>
<div class="sidebar">
    <i class="left-menu-icon fas fa-home"></i>
    <i class="left-menu-icon fas fa-user-friends"></i>
    <i class="left-menu-icon fas fa-bookmark"></i>
    <i class="left-menu-icon fas fa-search"></i>
    <i class="left-menu-icon fas fa-shopping-cart"></i>
</div>
<div class="container">
    <div class="content-container">
        <div class="featured-content"
             style="background-image: linear-gradient(rgba(0,0,0,0.1), #101820ff), url('https://img.wallpapersafari.com/desktop/1600/900/44/75/aBktCb.jpg');background-repeat:no-repeat; background-position: center;">
            <h1 class="featured-title">Huggs Liar </h1>
            <h3 class="featured-author"><i>by</i> Mia Castello </h3>
            <p class="featured-text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ut harum omnis
                praesentium possimus, exercitationem ea autem officia iusto quia beatae explicabo delectus vero sunt
                ipsum impedit reprehenderit optio quis sapiente.</p>
            <ul class="featured-hashtags">
                <li class="hashs">Toni Infante</li>
                <li class="hashs">On-Going</li>
                <li class="hashs">Manhwa</li>
                <li class="hashs">YA, Magic, Sorcery</li>
            </ul>
            <div class="button-section">
                <button class="featured-button">Read <i class="fas fa-book"></i></button>
                <i class="save-later far fa-bookmark"></i>
            </div>

        </div>
        <div class="book-list-container">
            <h1 class="book-list-title">NEW</h1>
            <div class="book-list-wrapper">
                <div class="book-list">
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/fc/03/11/fc0311102ad6db20a83969fc339c0fe9.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">The Matriarch</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/86/86/0a/86860a6fc3d852beb14138167d6d2ae7.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Rabbit &amp; Panther</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/43/8b/bf/438bbfd1aa2bb187b11e946ed2e2f741.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">A Peach Blossom</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/60/ca/96/60ca969b8073ced447d5f8c85e67dace.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Lead's Daughter</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/2a/a6/15/2aa615c9a4672166433952d0005076d8.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Hour Glass</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/3f/0b/71/3f0b7122f9be21f2ccf52d6050436534.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Lala Shi</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/4d/45/e0/4d45e0448e7934569993177bd873bb62.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Doctor Empress</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                </div>
                <i class="arrow fas fa-chevron-right "></i>
            </div>
        </div>
        <div class="book-list-container">
            <h1 class="book-list-title">TOP PICKS FOR YOU</h1>
            <div class="book-list-wrapper">
                <div class="book-list">
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/79/6c/ce/796ccecb83c8479b90d1e62b260678cb.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">I'm a Princess?</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/2e/d2/6f/2ed26f17eca311e8ffab0f1a381f9d4f.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Lady Baby</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/df/bb/92/dfbb92814290043e316a0eed647cb4d7.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Swapping You</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/ce/73/9d/ce739d1e6aaebd843bb501230c27fe08.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Villian's Family</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://cdn-4.ohay.tv/imgs/8353434f3efe4e2ba6b2/728.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Relive it</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/6d/3a/60/6d3a60915ad87a3ba8e536de61cdf6ac.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Perfumer</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/c4/02/a0/c402a03696f1ef0d95a9f5fe28fc54da.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">It was me </span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/71/48/db/7148dbbb104e147f38bc3d779100a0fe.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">MORE</span>
                        <p class="book-list-item-desc">There is so much more from where these came from</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Browse</button>
                        </div>
                    </div>
                </div>
                <i class="arrow fas fa-chevron-right "></i>
            </div>
        </div>
        <div class="book-list-container">
            <h1 class="book-list-title">TRENDING</h1>
            <div class="book-list-wrapper">
                <div class="book-list">
                    <div class="book-list-item">
                        <img src="https://www.anime-planet.com/images/manga/covers/58984.jpg?t=1610071515" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Faking style</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/99/8b/07/998b0787ae55f1fc165b4f773e068013.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Phoinex</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/a6/d7/b9/a6d7b948db90556859c2fea9aa841eb5.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">ID is New</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/db/c4/cc/dbc4cc27a6d7014bc93ca1f1b0180e71.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">My Family</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/19/9d/42/199d42271c9a3723481994ed5ff1f6d8.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Anti-fan</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/bb/8b/c0/bb8bc0c13d52689b88d7dcd97c305c6e.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Leander Midnight</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>

                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/6e/de/99/6ede9926ab94d869e75727e59794496f.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Silver</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/71/48/db/7148dbbb104e147f38bc3d779100a0fe.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">MORE</span>
                        <p class="book-list-item-desc">There is so much more from where these came from</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Browse</button>
                        </div>
                    </div>

                </div>
                <i class="arrow fas fa-chevron-right "></i>
            </div>
        </div>
        <div class="featured-content"
             style="background-image: linear-gradient(rgba(0,0,0,0.1), #101820ff), url('https://thecinetalk.com/wp-content/uploads/2021/07/True-Beauty-cover-e1589640682184.jpg');background-repeat:no-repeat; background-position: center;">
            <h1 class="featured-title">TRUE BEAUTY </h1>
            <h3 class="featured-author"><i>by</i> Yaongyi </h3>
            <p class="featured-text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ut harum omnis
                praesentium possimus, exercitationem ea autem officia iusto quia beatae explicabo delectus vero sunt
                ipsum impedit reprehenderit optio quis sapiente.</p>
            <ul class="featured-hashtags">
                <li class="hashs">Yaongyi</li>
                <li class="hashs">Completed</li>
                <li class="hashs">Manhwa</li>
                <li class="hashs">Drama, Romance</li>
            </ul>
            <div class="button-section">
                <button class="featured-button">Read <i class="fas fa-book"></i></button>
                <i class="save-later far fa-bookmark"></i>
            </div>

        </div>
        <div class="book-list-container">
            <h1 class="book-list-title">MY READS</h1>
            <div class="book-list-wrapper">
                <div class="book-list">
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/ce/73/9d/ce739d1e6aaebd843bb501230c27fe08.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Villian's Family</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/96/d7/69/96d769147ddc338d7723a1aa670b4b5c.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Witch of Mueiler</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/3e/05/54/3e05545915ee88a1668fbeb10a0c8aac.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Cloud Bell</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/c5/6e/23/c56e23550d4a021a8d748eb6b37c6207.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Dukes' Mansion</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/e5/1e/91/e51e915430f8d81579e67979465aca51.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Pancom Cheya</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/b4/68/c5/b468c5bcf6cd3a4edeb0b5a7b099c055.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Scrounge</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/c2/8b/27/c28b27f2cc7adefa22c0b7dfe70b40b7.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Charming The Beast</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>

                </div>
                <i class="arrow fas fa-chevron-right "></i>
            </div>
        </div>
        <div class="book-list-container">
            <h1 class="book-list-title">COMPLETED SERIES</h1>
            <div class="book-list-wrapper">
                <div class="book-list">
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/a4/fd/c0/a4fdc011c14367fa4b6f3d92288cedf4.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Here</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/a9/a8/6c/a9a86c4ee8ad78421e1bb70a8efc8c17.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Cotton Candy</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/95/0d/71/950d714157b694a454ecbace58d3637c.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Dan-Ban</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/f7/85/c4/f785c4c1370a63948553756e7ff070a5.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">The Silvers</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/75/00/d7/7500d75fbcaf6f8d9e9d570d529dae1b.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Adopted Dad</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/4b/c5/5e/4bc55e51895765ffbd14ec898d41e1b9.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Healer</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/46/fd/82/46fd8286ac1afaa84559bc3d9ab89573.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">Lottie</span>
                        <p class="book-list-item-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti
                            tempore asperiores incidunt.</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Read</button>
                            <i class="insider far fa-bookmark"></i></div>
                    </div>
                    <div class="book-list-item">
                        <img src="https://i.pinimg.com/564x/71/48/db/7148dbbb104e147f38bc3d779100a0fe.jpg" alt=""
                             class="book-list-item-img">
                        <span class="book-list-item-title">MORE</span>
                        <p class="book-list-item-desc">There is so much more from where these came from</p>
                        <div class="button-class">
                            <button class="book-list-item-button">Browse</button>
                        </div>
                    </div>
                </div>
                <i class="arrow fas fa-chevron-right "></i>
            </div>
        </div>
    </div>
</div>
<script>
    const arrows = document.querySelectorAll(".arrow");
    const booklists = document.querySelectorAll(".book-list");

    arrows.forEach((arrow, i) => {

        const itemNumber = booklists[i].querySelectorAll("img").length;
        let clickCounter = 0;
        arrow.addEventListener("click", () => {
            const ratio = Math.floor(window.innerWidth / 270);
            clickCounter++;
            if (itemNumber - (3 + clickCounter) + (4 - ratio) >= 0) {
                booklists[i].style.transform = `translateX(${booklists[i].computedStyleMap().get("transform")[0].x.value-300}px)`;
            } else {
                booklists[i].style.transform = "translateX(0)";
                clickCounter = 0;
            }
        });


        //console.log(booklists[i].querySelectorAll("img").length)
        //console.log(Math.floor(window.innerWidth/270));
    });


    //toggle
    const ball = document.querySelector(".toggle-ball");
    const items = document.querySelectorAll(".container,.book-list-title,.navbar-container,.sidebar,.left-menu-icon,.toggle");

    ball.addEventListener("click", () => {
        items.forEach(item => {
            item.classList.toggle("active")
        })
        ball.classList.toggle("active")
    })
</script>
</body>
</html>
