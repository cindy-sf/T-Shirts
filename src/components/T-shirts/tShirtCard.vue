<template>
        <div class="tShirt" id="tShirt" key="div">
            <div class="tShirt-card">
                <h3>{{tShirt.brand}}</h3>
                <router-link
                  :to="{
                    path: '/T-shirt/:id/:reference',
                    name: 'product-detail-component',
                    params: {
                      id: tShirt.id,
                      reference: tShirt.reference,
                      price: tShirt.price,
                      img: tShirt.url_img,
                      brand: tShirt.brand,
                      description: tShirt.description,
                      color: tShirt.color,
                      isAddedToCart: tShirt.isAddedToCart,
                    }
                  }"
                >
                    <figure>
                        <img :src="getImgSrc(tShirt.url_img)"> 
                    </figure>
                </router-link>
                <hr>
                <p><i class="fas fa-shopping-bag"></i> {{tShirt.price}} $</p>
            </div>
        </div> 
</template>

<script lang="js">
import { Component, Prop, Vue } from 'vue-property-decorator';
import ProductDetail from './ProductDetail.vue';

export default {
    props: {
		tShirt: {
			type: Object,
			required: true
        }
    },

    components: {
        'product-detail': ProductDetail
    },

    methods: {
        getImgSrc (url) {
            return url ? require(`@/assets/t-shirts/${url}`) : require('@/assets/t-shirts/404.png');
        },
    },
}
</script>

<style lang="scss" scoped>

.tShirt {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: auto;
    margin-left: auto;
}

.tShirt-card {
    width: 250px;
    height: 350px;
    margin: 25px;
    box-shadow: 0px 0px 20px 0px rgba(50, 50, 50, 0.89);
    border-radius: 10px;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    overflow: hidden;
    &:before {
        width: 250px;
        height: 55px;
        background-color: rgb(0, 0, 0);
        content: '';
        position: absolute;
        z-index: -1;
        top: 0;
        left: 0;
        right: 0;
    }
    h3 {
        text-align: center;
        color: #fff;
        text-transform: capitalize;
    }
    hr {
        width: 80%;
        display: block;
        margin: auto;
        height: 1px;
        background-color: #000;
    }
    figure {
        width: 100%;
        height: 200px;
        transition: .3s ease-in;
        &:hover {
            cursor: pointer;
            opacity: 0.7;
        }
        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    }

    p, i {
        color: #000;
    }

    p{
        font-family: 'Montserrat', 'sans-serif';
        font-weight: 300;
        font-size: 17px;
    }
}


</style>
