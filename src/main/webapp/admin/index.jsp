<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script src="<c:url value="https://cdn.tailwindcss.com"/>"></script>
    <script src="<c:url value="https://cdn.lordicon.com/ritcuqlt.js"/>"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <title>Image Gallery</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="/includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <jsp:include page="/includes/sidebar.jsp"/>
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen">
                <!-- ADMIN -->
                <div class="mt-6 max-w-full">
                    <!-- Main content here -->
                    <section class="flex flex-col gap-4 rounded-xl bg-white p-5">
                        <div class="flex items-center justify-between">
                            <div>
                                <h2 class="text-xl font-bold text-indigo-500 md:text-2xl">Quản lý hệ thống</h2>
                                <p class="text-gray-600">Chào bạn một ngày mới thật tươi vui!</p>
                            </div>
                            <div class="flex gap-x-6">
                                <button id="list-image" class="inline-block text-sm font-semibold hover:text-indigo-400 md:text-base">Photo</button>
                                <button id="list-album" class="inline-block text-sm font-semibold hover:text-indigo-400 md:text-base">Ablum</button>
                                <button id="list-user" class="inline-block text-sm font-semibold hover:text-indigo-400 md:text-base">User</button>
                            </div>
                        </div>

                        <!-- IMAGE -->
                        <div id="image" class="columns-3xs gap-4">
                            <c:forEach items="${images}" var="image">
                                <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                                    <div class="group relative overflow-hidden rounded-xl">
                                        <img
                                                class="object-cover object-center transition duration-200 group-hover:scale-110"
                                                src="${image.filePath}"
                                                alt="${image.title}"
                                        />
                                        <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                                            <div class="flex justify-between">
                                                <div class="flex flex-col text-white">
                                                    <p class="text-sm font-bold">${image.title}</p>
                                                    <p class="text-xs">${image.user.username}</p>
                                                </div>
                                                <div class="flex gap-x-2">
                                                    <c:url var="editLink" value="/admin">
                                                        <c:param name="command" value="load"/>
                                                        <c:param name="id" value="${image.id}"/>
                                                    </c:url>
                                                    <a href="${editLink}">
                                                        <button class="flex items-center rounded-full bg-white/20 p-2" title="Edit">
                                                            <lord-icon src="https://cdn.lordicon.com/hbigeisx.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                        </button>
                                                    </a>
                                                    <c:url var="deleteLink" value="/admin">
                                                        <c:param name="command" value="delete"/>
                                                        <c:param name="id" value="${image.id}"/>
                                                    </c:url>
                                                    <a href="${deleteLink}" onclick="if(!(confirm('Sure?'))) return false">
                                                        <button class="flex items-center rounded-full bg-white/20 p-2" title="Delete">
                                                            <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                            </c:forEach>
                        </div>
                        <!-- IMAGE - END -->
                        <!-- ALBUM -->
                        <div id="album" class="columns-3xs gap-4">
                            <c:forEach var="album" items="${albums}" varStatus="status">
                                <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                                    <div class="group relative overflow-hidden rounded-xl">
                                        <img
                                                class="object-cover object-center transition duration-200 group-hover:scale-110"
                                                src="${albumsCoverImages[status.index].filePath}"
                                                alt="${album.title}"
                                        />
                                        <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                                            <div class="flex justify-between">
                                                <div class="flex flex-col text-white">
                                                    <a href="<c:url value="/view/album?albumId=${album.id}"/>"><p class="text-sm font-bold">${album.title}</p></a>
                                                    <p class="text-xs">${album.user.username}</p>
                                                </div>
                                                <div class="flex gap-x-2">
                                                    <c:url var="editLink" value="/admin">
                                                        <c:param name="command" value="loadAlbum"/>
                                                        <c:param name="albumId" value="${album.id}"/>
                                                    </c:url>
                                                    <a href="${editLink}">
                                                        <button class="flex items-center rounded-full bg-white/20 p-2" title="Edit">
                                                            <lord-icon src="https://cdn.lordicon.com/hbigeisx.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                        </button>
                                                    </a>
                                                    <c:url var="deleteLink" value="/admin">
                                                        <c:param name="command" value="deleteAlbum"/>
                                                        <c:param name="albumId" value="${album.id}"/>
                                                    </c:url>
                                                    <a href="${deleteLink}" onclick="if(!(confirm('Sure?'))) return false">
                                                        <button class="flex items-center rounded-full bg-white/20 p-2" title="Delete">
                                                            <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                            </c:forEach>
                        </div>
                        <!-- ALBUM - END -->
                        <!-- USER -->
                        <div id="user" class="shadow-xs w-full overflow-hidden rounded-xl">
                            <div class="w-full overflow-x-auto">
                                <table class="w-full table-auto">
                                    <thead>
                                    <tr class="border-b bg-white font-semibold uppercase text-slate-700">
                                        <th class="px-4 py-3">Client</th>
                                        <th class="px-4 py-3">Location</th>
                                        <th class="px-4 py-3">Status</th>
                                        <th class="px-4 py-3">Date</th>
                                        <th class="px-4 py-3">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody class="divide-gray-200 bg-white">
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td class="py-2">
                                                <div class="flex items-center text-sm">
                                                    <div class="relative mr-3 h-8 w-8 rounded-full md:block">
                                                        <img
                                                                class="h-full w-full rounded-full object-cover"
                                                                src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w="
                                                        />
                                                    </div>
                                                    <div>
                                                        <a href="<c:url value="/profile?id=${user.id}"/>"><p class="truncate font-semibold">${user.username}</p></a>
                                                        <p class="truncate text-xs text-gray-600">${user.email}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="py-2 text-right text-sm">
                                                <div class="flex items-center justify-center">${user.location}</div>
                                            </td>
                                            <td class="py-2 text-sm">
                                                <div class="flex items-center justify-center">
                                                    <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-sm font-medium leading-5 text-indigo-600">Đang hoạt động</span>
                                                </div>
                                            </td>
                                            <td class="py-2 text-sm">
                                                <div class="flex items-center justify-center">${user.created_at}</div>
                                            </td>
                                            <td class="py-2 flex justify-center">
                                                <a href="<c:url value="/profile?id=${user.id}"/>">
                                                    <button class="flex items-center rounded-full bg-white/20 p-2" title="Edit">
                                                        <lord-icon src="https://cdn.lordicon.com/hbigeisx.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                                                    </button>
                                                </a>
                                                <c:url var="deleteLink" value="/admin">
                                                    <c:param name="command" value="deleteUser"/>
                                                    <c:param name="userId" value="${user.id}"/>
                                                </c:url>
                                                <a href="${deleteLink}" onclick="if(!(confirm('Sure?'))) return false">
                                                    <button class="flex items-center rounded-full bg-white/20 p-2" title="Delete">
                                                        <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                                                    </button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="flex justify-between border-t px-4 py-3 text-sm font-semibold uppercase tracking-wide text-gray-500">
                                <span class="col-span-3 flex items-center"> Digital Product Marketplace - 2023 </span>
                                <!-- Pagination -->
                                <span class="col-span-4 mt-2 flex sm:mt-auto sm:justify-end">
                                            <nav aria-label="Table navigation">
                                                <ul class="inline-flex items-center">
                                                    <li>
                                                        <button class="rounded-l-lg px-3 py-1 focus:outline-none">
                                                            <!-- ICON -->
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button class="px-3 py-1 focus:outline-none">1</button>
                                                    </li>
                                                    <li>
                                                        <button
                                                                class="rounded-md border border-r-0 border-purple-600 bg-purple-600 px-3 py-1 text-white transition-colors duration-150 focus:outline-none"
                                                        >
                                                            2
                                                        </button>
                                                    </li>
                                                    <li>
                                                        <button class="px-3 py-1 focus:outline-none">4</button>
                                                    </li>
                                                    <li>
                                                        <span class="px-3 py-1">...</span>
                                                    </li>
                                                    <li>
                                                        <button class="px-3 py-1 focus:outline-none">8</button>
                                                    </li>
                                                    <li>
                                                        <button class="rounded-r-lg px-3 py-1 focus:outline-none">
                                                            <!-- ICON -->
                                                        </button>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </span>
                            </div>
                        </div>
                        <!-- USER - END -->

                        <div class="flex items-start justify-between gap-8 sm:items-center">
                            <p class="max-w-screen-sm text-sm text-gray-500 lg:text-base">
                                This is a section of some simple filler text, also known as placeholder text. It shares some characteristics of a real written text.
                            </p>
                            <a href="#" class="inline-block text-sm font-semibold text-indigo-500/50 hover:text-indigo-400 active:text-indigo-600 md:text-base">Xem tất cả</a>
                        </div>
                    </section>
                </div>

            </div>
        </div>
    </main>

</div>

<script>
    ScrollReveal().reveal('.columns-3xs', { delay: 1000 });
    ScrollReveal().reveal('body', { delay: 500 });
</script>
<script>
    $(document).ready(function () {
        const $image = $('#image');
        const $user = $('#user');
        const $album = $('#album');
        const $listImage = $('#list-image');
        const $listUser = $('#list-user');
        const $listAlbum = $('#list-album');

        $image.removeClass('hidden');

        $listImage.click(function () {
            $image.removeClass('hidden');
            $user.addClass('hidden');
            $album.addClass('hidden');
            $listImage.addClass('text-indigo-400 active');
            $listUser.removeClass('text-indigo-400 active');
            $listAlbum.removeClass('text-indigo-400 active');
        });

        $listUser.click(function () {
            $user.removeClass('hidden');
            $image.addClass('hidden');
            $album.addClass('hidden');
            $listUser.addClass('text-indigo-400 active');
            $listImage.removeClass('text-indigo-400 active');
            $listAlbum.removeClass('text-indigo-400 active');
        });

        $listAlbum.click(function () {
            $album.removeClass('hidden');
            $user.add('hidden');
            $image.addClass('hidden');
            $listAlbum.addClass('text-indigo-400 active');
            $listUser.removeClass('text-indigo-400 active');
            $listImage.removeClass('text-indigo-400 active');
        });

        $listUser.click(); // tự động active vào mục "LIST TABLE"
    });
</script>
<script>
    $(document).ready(function () {
        $('#myDiscover').click(function () {
            $('#myBox_Discover').toggleClass('hidden');
        });
        $('#myAvatar').click(function () {
            $('#myBox_Avatar').toggleClass('hidden');
        });
        $('#myProducts').hover(function () {
            $('#myBox_Products').toggleClass('hidden');
        });
        $('#close-banner').click(function () {
            $('#myBanner').toggleClass('hidden block');
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Show Sidebar Icon and Title
        // $('#sidebar-icon').show();
        $('#sidebar-home').hide();
        $('#sidebar-about').hide();
        $('#sidebar-admin').hide();

        // Hide Sidebar by Default
        $('#sidebar').addClass('hidden lg:block');

        // Toggle Sidebar on Button Click
        $('#sidebar-toggle').click(function () {
            $('#sidebar').toggleClass('min-w-[16rem]');
            $('#sidebar-home').toggle();
            $('#sidebar-about').toggle();
            $('#sidebar-admin').toggle();
        });
    });
</script>
</body>
</html>
