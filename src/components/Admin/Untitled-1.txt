<template>
    <div>
        <form action="" method="post">
            <div class="nav">
                <label for="toggle">&#9776;</label>
                <router-link to="/">
                    <i class="fas fa-times"></i>
                </router-link>
            </div>
            <div class="form-img"></div>
            <div class="form-info">
        
                <h2>Créer un t-shirt n'a jamais été aussi simple !</h2>
                <input type="text" name="" id="" placeholder="Référence" v-model="reference">
                <input type="text" name="" id="" placeholder="Couleur" v-model="color"> 
                <input type="text" name="" id="" placeholder="Description" v-model="description"> 
                <!-- <input type="text" name="" id="" placeholder="T-Shirt url_img" v-model="url_img">  -->
                <br>
                <label for="">T-shirt id_brand : </label>
                <select name="id_brand" id="" v-model="id_brand"> 
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>  
                <br>
                <input type="number" name="" id="" placeholder="0 EUR" v-model="price">
                <br>
                <input type="submit" :value="submitValue" @click="postTshirts($event)">
        
            </div>
        </form>
        <div class="modal" ref="tShirtModal">
            <p>T-Shirt Créer</p>
        </div>
    </div>
</template>


<script>
import axios from 'axios';
export default {
    data(){
        return {
            tShirts: [],
            submitValue: 'Créer un Tshirt +',
            id_brand : "",
            reference : "",
            price : "",
            color: "",
            description: "",
            //url_img: "",
        }
    },
    
    methods: {
        getTshirts () {
        const url= "http://localhost:3030/api/products";
            axios.get(url).then(res => {
                this.tShirts = res.data;
            }).catch(err => {
                console.log(err)
            })
        },

        checkedTshirt() {
            this.submitValue = "✓";
        },

        openModal() {
            let modal = this.$refs.tShirtModal;
            modal.classList.add('open');
            window.setTimeout(function(){
                modal.classList.remove('open');
            },2000);
        },

        postTshirts(e) {
                e.preventDefault();
                axios.post('http://localhost:3030/api/products', {
                id_brand : this.id_brand,
                reference : this.reference,
                price : this.price,
                //url_img: this.url_img,
                color: this.color,
                description: this.description,
            })
            .then(response => {
                console.log(response)
                this.checkedTshirt();
                this.openModal();
            })
        }
    },

    created() {
        this.getTshirts();
    }
}
</script>

<style lang="scss" scoped>
button {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 150px;
    height: 50px;
    font-family: 'Quicksand';
    font-weight: 200;
    text-transform: uppercase;
    background-color: #000;
    color: #fff;
    border: none;
    cursor: pointer;
}

form {
    width: 900px;
    height: 550px;
    border-radius: 5px;
    box-shadow: 0px 0px 15px 0px rgba(50, 50, 50, 0.5);
    margin: 110px auto;
}

.nav {
    width: 100%;
    height: 35px;
    border-bottom: 1px solid rgb(156, 156, 156);
    label, .fa-times {
        line-height: 35px;
        cursor: pointer;
    }
    label {
        float: left;
        padding-left: 5px;
    }
    .fa-times {
        float: right;
        padding-right: 10px;
        color: #000;
    }
}

.form-img, .form-info {
    height: 515px;
    width: 50%;
}

.form-img {
    float: left;
    // background-color: rgb(0, 0, 0);
    background: url('../../assets/t-shirts/bg-t-shirt.png') 0 0 no-repeat;
    background-size: contain;
    animation: toggleColor 20s alternate infinite;
}

.form-info {
    float: right;
    h2 {
        margin: 35px auto;
        font-size: 25px;
        max-width: 350px;
    }
    input {
        width: 80%;
        margin: auto;
        margin-bottom: 10px;
        display: block;
        height: 30px;
        border: 1px solid rgba(56, 44, 167, 0.5);
        color: #191548;
        &::placeholder {
            padding-left: 5px;
        }
    }
}

br + label {
    text-align: center;
    display: block;
    + select {
        display: block;
        margin: auto;
        margin-top: 10px;
    }
}

input[type="submit"] {
    width: 80%;
    height: 33px;
    background-color: rgb(56, 44, 167);
    color: #fff;
    border: none;
    cursor: pointer;
    transition: box-shadow .3s ease-in;
    &:hover {
        box-shadow: 0px 4px 20px 0px rgba(50, 50, 50, 0.75);
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

@keyframes toggleColor {
    25% {
        filter: grayscale(200%);
    }

    50% {
        filter: hue-rotate(90deg);
    }

    75% {
        filter: grayscale(200%);
    }

    100% {
        filter: none;
    }
}

</style>
