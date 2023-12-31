<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function formatVietnamesePrice(price) {
        return price.toLocaleString("vi-VN", {style: 'currency', currency: 'VND'});
    }

    document.addEventListener('DOMContentLoaded', function () {
        const imagePrice = ${image.price};
        const price = document.getElementById('price');
        price.innerText = formatVietnamesePrice(imagePrice);
    });

</script>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <title>Ảnh</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="/includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen h-screen">
                <div class="mt-6 max-w-full">
                    <!-- Main PRODUCTS -->
                    <section class="flex justify-between gap-4 rounded-xl bg-white p-5">
                        <div class="inline-block flex-1">
                            <!-- Image -->
                            <div class="flex h-[30rem] items-center justify-center rounded-xl border">
                                <img
                                        src="${image.filePath}"
                                        alt="Your Image"
                                        class="max-h-full max-w-full object-contain"
                                />
                            </div>
                            <!-- Image - End -->
                            <!-- Info -->
                            <div class="flex items-center justify-between py-4">
                                <div class="flex text-slate-800">
                                    <p class="text-2xl font-semibold">${image.title}</p>
                                </div>
                                <div class="flex gap-x-2 items-center">
                                    <p class="text-sm font-bold text-red-400" id="price">0</p>
                                    <button class="flex items-center rounded-full border p-2 shadow-xl">
                                        <lord-icon src="https://cdn.lordicon.com/pmegrqxm.json" trigger="hover"
                                                   class="h-5 w-5"></lord-icon>
                                    </button>
                                    <form method="post" action="${pageContext.request.contextPath}/Purchase">
                                        <input type="hidden" name="action" value="ADD">
                                        <input type="hidden" name="type" value="image">
                                        <input type="hidden" name="imageId" value="${image.id}">
                                        <button type="submit" class="flex items-center rounded-full border p-2 shadow-xl">
                                            <lord-icon src="https://cdn.lordicon.com/medpcfcy.json" trigger="hover"
                                                       class="h-5 w-5"></lord-icon>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="flex items-center justify-between">
                                <div class="flex items-center gap-x-4">
                                    <button class="flex h-14 w-14 items-center overflow-hidden rounded-lg">
                                        <img
                                                src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/88536213-dc4e-44c2-ba28-7b362cd7ee97/dfu52wy-cf02b963-e3e4-4f87-a41d-b268dbb6592b.png/v1/fill/w_894,h_894,q_70,strp/waterpixel_art__93_by_eynoxart_dfu52wy-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTkyMCIsInBhdGgiOiJcL2ZcLzg4NTM2MjEzLWRjNGUtNDRjMi1iYTI4LTdiMzYyY2Q3ZWU5N1wvZGZ1NTJ3eS1jZjAyYjk2My1lM2U0LTRmODctYTQxZC1iMjY4ZGJiNjU5MmIucG5nIiwid2lkdGgiOiI8PTE5MjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.0nbSLqiF5mUi6Ygb6ptQhDDTXu-QXQCO1L3xzVakaZs"
                                                alt="Photo by Himanshu Dewangan"
                                                class="h-full w-full object-cover object-center"
                                        />
                                    </button>

                                    <div class="flex flex-col">
                                        <a href="<c:url value="/profile?id=${image.user.id}"/>"><p class="text-xl font-bold text-indigo-400">${image.user.username}</p></a>
                                        <p class="text-md text-slate-500">${image.user.email}</p>
                                    </div>
                                </div>
                                <div class="flex gap-x-2">
                                    <p class="text-md font-medium text-slate-500">Ngày đăng: ${image.createdAt}</p>
                                </div>
                            </div>
                            <!-- Info - End -->
                        </div>

                        <div class="w-[20rem] flex-none">
                            <!-- User -->
                            <div class="flex items-center justify-between">
                                <div class="flex items-center gap-x-4">
                                    <span class="text-xl font-bold text-indigo-400">Ảnh</span>
                                </div>
                                <div class="flex gap-x-4">
                                    <lord-icon src="https://cdn.lordicon.com/hbigeisx.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                                    <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                                </div>
                            </div>
                            <!-- User - End -->
                            <div class="my-4">
                                <p class="text-md font-medium text-slate-600">${image.title}</p>
                            </div>

                            <!-- Gợi ý text -->
                            <div class="mb-4 flex items-center justify-between">
                                <div class="flex items-center gap-x-2">
                                    <p class="text-md font-medium text-indigo-400">Gợi ý</p>
                                    <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-xs font-medium leading-5 text-indigo-600">Mới</span>
                                </div>
                                <div class="flex gap-x-2">
                                    <p class="text-md font-medium text-slate-500">...</p>
                                </div>
                            </div>
                            <!-- Gợi ý text - End -->
                            <div class="columns-3 gap-2">
                                <c:forEach items="${randomImages}" var="randomImage">
                                    <a href="<c:url value="/view/image?id=${randomImage.id}"/>">
                                        <figure class="mb-2 [break-inside:avoid]">
                                            <div class="overflow-hidden rounded-xl">
                                                <img
                                                        class="object-cover object-center transition duration-200"
                                                        src="${randomImage.filePath}"
                                                        alt="${randomImage.title}"
                                                />
                                            </div>
                                        </figure>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>

</div>
</body>
</html>
