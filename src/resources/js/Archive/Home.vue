<script setup>
import { onBeforeUnmount, onMounted } from 'vue';
import { Head } from '@inertiajs/vue3';

const tabListeners = [];

onMounted(() => {
    const tabButtons = document.querySelectorAll('#image-tabs button[role="tab"]');
    const tabPanels = document.querySelectorAll('#image-tabs-content [role="tabpanel"]');

    if (!tabButtons.length || !tabPanels.length) return;

    const activateTab = (button) => {
        const target = button.getAttribute('data-tabs-target');
        if (!target) return;

        tabButtons.forEach((btn) => {
            btn.setAttribute('aria-selected', btn === button ? 'true' : 'false');
        });

        tabPanels.forEach((panel) => panel.classList.add('hidden'));

        const targetPanel = document.querySelector(target);
        if (targetPanel) {
            targetPanel.classList.remove('hidden');
        }
    };

    tabButtons.forEach((button, index) => {
        const handleHover = () => activateTab(button);
        const handleClick = () => activateTab(button);

        button.addEventListener('mouseover', handleHover);
        button.addEventListener('click', handleClick);

        tabListeners.push(() => {
            button.removeEventListener('mouseover', handleHover);
            button.removeEventListener('click', handleClick);
        });

        if (index === 0) {
            activateTab(button);
        }
    });
});

onBeforeUnmount(() => {
    tabListeners.forEach((removeListener) => removeListener());
    tabListeners.length = 0;
});
</script>
<template>
<div class="bg-white text-[#1a1a1a]">
    <Head title="The Review | Literary Journal" />

    <header class="border-b border-gray-200">
        <div class="max-w-screen-xl mx-auto px-4 py-6">
            <div class="flex justify-between items-center text-[10px] uppercase tracking-[0.2em] font-semibold text-gray-500 mb-8">
                <div class="flex space-x-4">
                    <a href="#" class="hover:text-black">Events</a>
                    <a href="#" class="hover:text-black">Donate</a>
                </div>
                <div class="flex space-x-4">
                    <a href="#" class="hover:text-black">Newsletters</a>
                    <a href="#" class="hover:text-black">Store</a>
                    <a href="#" class="hover:text-black">Sign In</a>
                </div>
            </div>

            <div class="text-center mb-10">
                <h1 class="serif text-5xl md:text-7xl font-bold tracking-tighter uppercase">The Review</h1>
            </div>

            <nav class="border-t border-gray-100 pt-4">
                <ul class="flex flex-wrap justify-center items-center gap-6 md:gap-12 text-[11px] uppercase tracking-[0.15em] font-bold">
                    <li><a href="#" class="hover:underline underline-offset-4">The Daily</a></li>
                    <li><a href="#" class="hover:underline underline-offset-4">The Quarterly</a></li>
                    <li><a href="#" class="hover:underline underline-offset-4">Authors</a></li>
                    <li><a href="#" class="hover:underline underline-offset-4">Audio</a></li>
                    <li><a href="#" class="hover:underline underline-offset-4 border-r pr-6 border-gray-300">About</a></li>
                    <li>
                        <button class="bg-[#2d4a53] text-white px-8 py-2.5 hover:bg-black transition duration-300">
                            Subscribe
                        </button>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
    <section class="max-w-screen-xl mx-auto px-4 py-12">    
            <div class="md:flex md:items-stretch mt-10">
                    <div class="md:w-7/12 p-0 overflow-hidden relative h-[320px] sm:h-[420px] md:h-[576px]">
                        <div id="image-tabs-content" class="h-full">
                            <div class="h-full" id="image1-content" role="tabpanel" aria-labelledby="image1-tab">
                                <img src="https://cdn.pixabay.com/photo/2015/10/22/17/28/stack-of-books-1001655_1280.jpg" alt="Main Character Syndrome in Wartime" class="w-full h-full object-cover object-center">
                            </div>
                            <div class="hidden h-full" id="image2-content" role="tabpanel" aria-labelledby="image2-tab">
                                <img src="https://cdn.pixabay.com/photo/2018/07/01/20/01/music-3510326_1280.jpg" alt="On Angst" class="w-full h-full object-cover object-center">
                            </div>
                            <div class="hidden h-full" id="image3-content" role="tabpanel" aria-labelledby="image3-tab">
                                <img src="https://cdn.pixabay.com/photo/2019/05/15/15/01/beard-4205158_1280.jpg" alt="You’ve Always Been the Caretaker" class="w-full h-full object-cover object-center">
                            </div>
                            <div class="hidden h-full" id="image4-content" role="tabpanel" aria-labelledby="image4-tab">
                                <img src="https://cdn.pixabay.com/photo/2023/03/08/23/21/books-7838952_1280.jpg" alt="Little Expressionless Animals" class="w-full h-full object-cover object-center">
                            </div>
                        </div>
                    </div>

                    <div class="md:w-5/12 bg-black text-white p-10 flex flex-col justify-between md:h-[576px]">
                        <div class="border-b border-gray-700" id="image-tabs" data-tabs-toggle="#image-tabs-content" role="tablist">
                            <button class="w-full text-left py-0 border-b border-gray-700 block group" id="image1-tab" data-tabs-target="#image1-content" type="button" role="tab" aria-controls="image1-content" aria-selected="true">
                                <p class="text-sm italic text-gray-400 group-hover:text-white">On the Daily</p>
                                <h3 class="text-2xl font-serif mt-2 group-hover:text-gray-300">Main Character Syndrome in Wartime</h3>
                                <p class="text-sm mt-3 text-gray-400 group-hover:text-white">By Julian Castronovo</p>
                            </button>
                            <button class="w-full text-left py-3 border-b border-gray-700 block group" id="image2-tab" data-tabs-target="#image2-content" type="button" role="tab" aria-controls="image2-content" aria-selected="false">
                                <p class="text-sm italic text-gray-400 group-hover:text-white">On the Daily</p>
                                <h3 class="text-2xl font-serif mt-2 group-hover:text-gray-300">On Angst</h3>
                                <p class="text-sm mt-3 text-gray-400 group-hover:text-white">By Jamieson Webster</p>
                            </button>
                            <button class="w-full text-left py-3 border-b border-gray-700 block group" id="image3-tab" data-tabs-target="#image3-content" type="button" role="tab" aria-controls="image3-content" aria-selected="false">
                                <p class="text-sm italic text-gray-400 group-hover:text-white">On the Daily</p>
                                <h3 class="text-2xl font-serif mt-2 group-hover:text-gray-300">You’ve Always Been the Caretaker</h3>
                                <p class="text-sm mt-3 text-gray-400 group-hover:text-white">By J. D. Daniels</p>
                            </button>
                            <button class="w-full text-left py-3 block group" id="image4-tab" data-tabs-target="#image4-content" type="button" role="tab" aria-controls="image4-content" aria-selected="false">
                                <p class="text-sm italic text-gray-400 group-hover:text-white">From the Archive</p>
                                <h3 class="text-2xl font-serif mt-2 group-hover:text-gray-300">Little Expressionless Animals</h3>
                                <p class="text-sm mt-3 text-gray-400 group-hover:text-white">By David Foster Wallace</p>
                            </button>
                        </div>

                        <div class="mt-10">
                            <a href="#" class="text-xs uppercase tracking-widest font-bold hover:text-gray-300">
                                see more stories
                            </a>
                        </div>
            </div>
        </div>
  </section>
        <section class="max-w-screen-xl mx-auto px-4 py-12">
            <h2 class="serif text-4xl mb-8">The Review</h2>
            <div class="relative group">
                <div class="flex overflow-x-auto space-x-8 pb-10 no-scrollbar">
                    <div class="flex-none w-44">
                        <img src="https://fastly.picsum.photos/id/870/200/300.jpg?blur=2&grayscale&hmac=ujRymp644uYVjdKJM7kyLDSsrqNSMVRPnGU99cKl6Vs" class="w-full shadow-lg border border-gray-100 transition-transform hover:scale-105">
                        <p class="text-[10px] uppercase text-center mt-4 tracking-widest text-gray-400">Winter 1955</p>
                    </div>
                    <div class="flex-none w-44 opacity-80">
                        <img src="https://fastly.picsum.photos/id/915/200/300.jpg?grayscale&hmac=n31kS_MLOTAQ8QtLAmepyO_2s1nP6AaFsSkc759-C9w" class="w-full shadow-lg border border-gray-100 transition-transform hover:scale-105">
                        <p class="text-[10px] uppercase text-center mt-4 tracking-widest text-gray-400">Fall 1955</p>
                    </div>
                    <div class="flex-none w-44">
                        <img src="https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI" class="w-full shadow-lg border border-gray-100 transition-transform hover:scale-105">
                        <p class="text-[10px] uppercase text-center mt-4 tracking-widest text-gray-400">Summer 1955</p>
                    </div>
                    <div class="flex-none w-44">
                        <img src="https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U" class="w-full shadow-lg border border-gray-100 transition-transform hover:scale-105">
                        <p class="text-[10px] uppercase text-center mt-4 tracking-widest text-gray-400">Spring 1955</p>
                    </div>
                    <div class="flex-none w-44">
                        <img src="https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1659822861i/61880241.jpg" class="w-full shadow-lg border border-gray-100 transition-transform hover:scale-105">
                        <p class="text-[10px] uppercase text-center mt-4 tracking-widest text-gray-400">Winter 1954</p>
                    </div>
                    <div class="flex-none w-44">
                        <img src="https://heyitscarlyrae.com/wp-content/uploads/2022/10/The-placeholder-book-feature-image-1.png" class="w-full shadow-lg border border-gray-100 transition-transform hover:scale-105">
                        <p class="text-[10px] uppercase text-center mt-4 tracking-widest text-gray-400">Fall 1954</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="max-w-screen-xl mx-auto px-4 py-16 border-t border-gray-200">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-16">
                
                <div class="lg:col-span-8">
                    <div class="mb-6 flex items-center space-x-4">
                        <span class="serif text-2xl italic text-gray-400">No. 7</span>
                        <span class="text-xs uppercase font-bold tracking-[0.2em]">Fall-Winter 1954-1955</span>
                    </div>
                    
                    <div class="grid md:grid-cols-2 gap-10 items-start">
                        <img src="https://i.etsystatic.com/13140000/r/il/5f752b/6967074626/il_794xN.6967074626_9kxf.jpg" class="w-full grayscale hover:grayscale-0 transition duration-700 shadow-xl">
                        <div>
                            <blockquote class="serif text-2xl leading-snug mb-8 italic">
                                “God is a character, a real and consistent being, or He is nothing”: An interview with Joyce Cary.
                            </blockquote>
                            <p class="text-sm text-gray-600 leading-relaxed mb-6">
                                “She kept nodding her head and pursing her mouth as if withholding some vital information like that the walls were wired to explode”: An essay by Pati Hill.
                            </p>
                            <a href="#" class="inline-block text-[11px] font-black uppercase border-b-2 border-black pb-1 hover:text-gray-500 hover:border-gray-500 transition">Read Article</a>
                        </div>
                    </div>
                </div>

                <div class="lg:col-span-4 lg:border-l lg:pl-12 border-gray-100">
                    <h3 class="text-[11px] font-bold uppercase tracking-[0.25em] mb-8 border-b pb-4 border-gray-800">Table of Contents</h3>
                    
                    <div class="space-y-8">
                        <div>
                            <h4 class="text-[10px] font-bold uppercase text-gray-400 mb-2 tracking-tighter">Poetry</h4>
                            <p class="serif text-lg leading-tight">A. Alvarez, <span class="italic">Catharsis</span></p>
                            <p class="serif text-lg leading-tight">Louis Coxe, <span class="italic">In Hibernis</span></p>
                        </div>
                        <div>
                            <h4 class="text-[10px] font-bold uppercase text-gray-400 mb-2 tracking-tighter">Fiction</h4>
                            <p class="serif text-lg leading-tight">Dino Buzzati, <span class="italic">Seven Storeys</span></p>
                            <p class="serif text-lg leading-tight">Evan S. Connell, <span class="italic">The Fisherman</span></p>
                        </div>
                        <div>
                            <h4 class="text-[10px] font-bold uppercase text-gray-400 mb-2 tracking-tighter">Art</h4>
                            <p class="serif text-lg leading-tight">Pablo Picasso, <span class="italic">Six Drawings</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="mt-20 border-t border-gray-200 pt-12 pb-8 bg-white">
    <div class="max-w-screen-xl mx-auto px-4">
        
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-12 space-y-8 md:space-y-0">
            
            <div class="flex items-center space-x-4">
                <a href="#" aria-label="Instagram" class="w-8 h-8 rounded-full border border-black text-black flex items-center justify-center hover:bg-black hover:text-white transition-colors duration-200">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="3" width="18" height="18" rx="5"></rect>
                        <circle cx="12" cy="12" r="4"></circle>
                        <circle cx="17.5" cy="6.5" r="1"></circle>
                    </svg>
                </a>
                <a href="#" aria-label="Facebook" class="w-8 h-8 rounded-full border border-black text-black flex items-center justify-center hover:bg-black hover:text-white transition-colors duration-200">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M13.5 21v-7h2.3l.4-3h-2.7V9.1c0-.9.3-1.6 1.6-1.6H16V4.8c-.3 0-1.2-.1-2.3-.1-2.3 0-3.8 1.4-3.8 4V11H7.5v3h2.4v7h3.6z"></path>
                    </svg>
                </a>
                <a href="#" aria-label="Twitter" class="w-8 h-8 rounded-full border border-black text-black flex items-center justify-center hover:bg-black hover:text-white transition-colors duration-200">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M21.2 7.2c-.7.3-1.3.4-2 .5.7-.4 1.2-1.1 1.5-1.9-.7.4-1.4.7-2.2.9A3.5 3.5 0 0 0 12.5 9c0 .3 0 .5.1.8A10 10 0 0 1 5.1 6a3.5 3.5 0 0 0 1.1 4.7c-.6 0-1.1-.2-1.6-.4v.1c0 1.7 1.2 3.2 2.8 3.5-.3.1-.7.1-1 .1h-.7c.5 1.5 2 2.6 3.8 2.6A7 7 0 0 1 4 18.1 9.9 9.9 0 0 0 9.4 19.7c6.5 0 10-5.4 10-10v-.5c.7-.5 1.3-1.1 1.8-2z"></path>
                    </svg>
                </a>
                <a href="#" aria-label="Bluesky" class="w-8 h-8 rounded-full border border-black text-black flex items-center justify-center hover:bg-black hover:text-white transition-colors duration-200">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 11.4c1.3-2.2 3.6-5.1 5.8-6.6 1.6-1.1 3-1 3.3-.4.4.7-.1 2-1 3.3-1.2 1.7-3.5 3.7-5.5 4.9 2 .6 4.6 1.9 6 3.7 1 1.3 1.5 2.7 1 3.4-.5.8-2.2.5-3.9-.8-2.2-1.7-4.3-4.8-5.7-7.1-1.4 2.3-3.5 5.4-5.7 7.1-1.7 1.3-3.4 1.6-3.9.8-.5-.7 0-2.1 1-3.4 1.4-1.8 4-3.1 6-3.7-2-1.2-4.3-3.2-5.5-4.9-.9-1.3-1.4-2.6-1-3.3.3-.6 1.7-.7 3.3.4 2.2 1.5 4.5 4.4 5.8 6.6z"></path>
                    </svg>
                </a>
                <a href="#" aria-label="RSS" class="w-8 h-8 rounded-full border border-black text-black flex items-center justify-center hover:bg-black hover:text-white transition-colors duration-200">
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                        <circle cx="6" cy="18" r="2"></circle>
                        <path d="M4 10a10 10 0 0 1 10 10h-3A7 7 0 0 0 4 13v-3z"></path>
                        <path d="M4 4a16 16 0 0 1 16 16h-3A13 13 0 0 0 4 7V4z"></path>
                    </svg>
                </a>
            </div>

            <div class="grid grid-cols-4 sm:grid-cols-4 gap-x-12 gap-y-4">
                <div class="flex flex-col space-y-1">
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Subscribe</a>
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Support</a>
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Contact Us</a>
                </div>
                <div class="flex flex-col space-y-1">
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Events</a>
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Media Kit</a>
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Submissions</a>
                </div>
                <div class="flex flex-col space-y-1">
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Masthead</a>
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Prizes</a>
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Bookstores</a>
                </div>
                <div class="flex flex-col space-y-1">
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Opportunities</a>
                    <a href="#" class="text-[10px] font-bold uppercase tracking-widest hover:text-gray-500">Video</a>
                </div>
            </div>
        </div>

        <div class="w-full mb-8">
            <img src="/assets/images/footer_sketch.png" 
                 alt="Paris Sketch" 
                 class="w-full h-85 object-cover grayscale opacity-80">
        </div>

        <div class="flex flex-col md:flex-row justify-between items-center border-t border-gray-100 pt-6">
            <p class="text-[9px] font-bold uppercase tracking-[0.2em] text-gray-500 mb-4 md:mb-0">
                ©2026 THE PARIS REVIEW. ALL RIGHTS RESERVED.
            </p>
            <div class="flex space-x-6">
                <a href="#" class="text-[9px] font-bold uppercase tracking-[0.2em] text-gray-500 hover:text-black">Privacy Policy</a>
                <a href="#" class="text-[9px] font-bold uppercase tracking-[0.2em] text-gray-500 hover:text-black">Terms & Conditions</a>
            </div>
        </div>
    </div>
</footer>
</div>
</template>
<style scoped>
.serif { font-family: 'Playfair Display', serif; }
.no-scrollbar::-webkit-scrollbar { display: none; }
.no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
</style>
