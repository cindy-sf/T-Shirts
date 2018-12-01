<template>
    <div>
        <div class="product-detail">
        
            <router-link to="/">
                <i class="fas fa-times"></i>
            </router-link>
        
            <figure>
                <img :src="getImgSrc(this.$route.params.img)" alt="">
            </figure>
        
            <div class="product-detail-background">
                <p>{{ this.$route.params.brand }}</p>
            </div>
        
           <div class="product-detail-info">
                <h1>{{ this.$route.params.brand }}</h1>
                <hr>
                <h3>Ref: {{ this.$route.params.reference }}</h3>
                <div class="editable">
                    <textarea @change="editTshirt" v-model="description" spellcheck="false"></textarea>
                </div>
                    <p class="product-price">{{ this.$route.params.price }} $</p>
                <button @click="addToCart(id)">Ajouter au panier</button>  
                <i class="far fa-trash-alt" @click="deleteProduct(id)"></i>
           </div>
        
        </div>

        <div class="modal" ref="tShirtModal">
            <p>T-Shirt Modifié.</p>
        </div>

    </div>
</template>

<script>

import axios from 'axios';

    export default {

        props: ['id', 'price', 'reference', 'img', 'isAddedToCart'],

        data() {
            return {
                description: this.$route.params.description,
            }
        },
    
        methods: {
            getImgSrc (url) {
                return url ? require(`@/assets/t-shirts/${url}`) : require('@/assets/t-shirts/404.png');
            },

            addToCart (id) {
                let params = this.$route.params;
                if (params.id === id) {
                    params.isAddedToCart = true;
                    console.log(params.isAddedToCart)
                this.productsAdded();
                }
            },

            openModal() {
                let modal = this.$refs.tShirtModal;
                modal.classList.add('open');
                window.setTimeout(function(){
                    modal.classList.remove('open');
                },2000);
            },

            editTshirt() {
                    let params = this.$route.params;
                    axios.patch('http://localhost:3030/api/products', {
                    reference : params.reference,
                    price : params.price,
                    url_img: params.img,
                    description: this.description,
                    id : params.id,
                })
                .then(response => {
                    console.log("response :", response);
                    this.openModal();
                })
            },

            deleteProduct (id) {
                let params = this.$route.params;
                console.log("T-Shirt id :", params.id);
                
                if (confirm("Êtes-vous sûr de vouloir supprimer ce produit ?")) {
                    axios.delete('http://localhost:3030/api/products', {
                        data: {idProduct: params.id}
                    })
                    .then(response => {
                        console.log("coucou axios ID : ", response.data)
                    })
                    .then(function() {
                        window.alert('Produit suprimé');
                        window.location.href = "/";
                    })
                }
                
            },

            productsAdded () {
                    return this.$route.params.isAddedToCart;
                    console.log("Length ==>", this.$route.params.isAddedToCart.length)
            },

        },
    }

</script>

<style lang="scss" scoped>

.product-detail {
    width: 900px;
    height: 450px;
    margin-top: 150px;
    margin-bottom: 85px;
    margin-left: auto;
    margin-right: auto;
    position: relative;
    box-shadow: 0px 0px 15px 0px rgba(50, 50, 50, 0.75);
    border-radius: 15px;
    overflow: hidden;
}

.product-detail-background {
    width: 50%;
    height: 100%;
    background-color: #181818;
    float: left;
    clip-path: polygon(73% 0, 54% 51%, 73% 100%, 0 100%, 0% 50%, 0 0);
    display: flex;
    justify-content: center;
    p {
        color: #fff;
        font-size: 20px;
        text-transform: uppercase;
        font-style: italic;
        font-weight: bold;
        text-decoration: line-through;
    }
}

figure {
        width: 310px;
        height: 310px;
        margin: auto;
        position: absolute;
        left: 110px;
        z-index: 2;
        top: 80px;
        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    }

.product-detail-info {
    width: 50%;
    height: 100%;
    float: right;
    padding-left: 10px;
    h1 {
        margin-top: 20px;
        text-transform: capitalize;
        font-size: 50px;
    }
    hr {
        width: 75px;
        height: 1px;
        background-color: #000;
        border: 1px solid;
        display: block;
        margin-top: 5px;
        margin-bottom: 15px;
    }
    p {
        margin-bottom: 25px;
        width: 355px;
    }
    h3 {
        color: grey;
    }
    i {
        float: right;
        cursor: pointer;
        margin: 12px;
        margin-top: 30px;
    }
    .fa-trash-alt {
        margin-right: 150px;
    }
}

.product-price {
    font-weight: bold;
}

button {
    width: 150px;
    height: 50px;
    background-color: rgb(29, 29, 29);
    color: #fff;
    border: none;
    cursor: pointer;
    // display: block;
    transition: box-shadow .2s ease-in;
    &:hover {
        box-shadow: 0px 5px 15px 0px rgba(20, 20, 20, 0.39);
    }
}

.fa-times {
    position: absolute;
    right: 20px;
    top: 20px;
    color: #000;
    font-size: 20px;
}

textarea {
    height: 100px;
    resize: none;
    text-align: left;
    padding-left: 0;
    margin: 20px 0px;
    width: 355px;
    border: none;
    font-size: 15px;
    
}

.editable {
    width: auto;
    height: auto;
    position: relative;
    &:before {
        font-family: "Font Awesome 5 Free";
        content: "\f304";
        position: absolute;
        right: 60px;
        top: 50px;
        font-weight:900;
        display: none;
    }
    &:hover {
        &:before {
            display: block;
        }
    }
}

.modal {
    width: 350px;
    height: 50px;
    position: absolute;
    width: 100%;
    height: 70px;
    left: 0;
    right: 0;
    top: -100px;
    z-index: 5;
    box-shadow: 0px 0px 15px 0px rgba(50, 50, 50, 0.5);
    background-color: #000;
    color: #fff;
    transition: all .3s ease-in;
    p {
        text-align: center;
        font-size: 25px;
        margin-top: 15px;
    }
}

.modal.open {
    top: 0px;
}
</style>