<template>
    <form action="" method="post">
        <!-- Ajouter un T-Shirt n'a jamais été aussi simple ! -->
        <div class="nav">
            <label for="toggle">&#9776;</label>
            <router-link to="/">
                <i class="fas fa-times"></i>
            </router-link>
        </div>
        <div class="form-img">

        </div>
        <div class="form-info">

            <h2>Ajouter un T-Shirt n'a jamais été aussi simple !</h2>
            <input type="text" name="" id="" placeholder="T-Shirt name" v-model="reference">
            <input type="text" name="" id="" placeholder="T-Shirt color" v-model="color"> 
            <input type="text" name="" id="" placeholder="T-Shirt description" v-model="description"> 
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

        postTshirts(e) {
                e.preventDefault();
                axios.post('http://localhost:3030/api/products', {
                id_brand : this.id_brand,
                reference : this.reference,
                price : this.price,
                color: this.color,
                description: this.description,
                //url_img: this.url_img,
            })
            .then(response => {
                console.log(response)
                this.checkedTshirt();
            })
        }
    },

    created() {
        this.getTshirts();
    },

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
    width: 800px;
    height: 500px;
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
        padding-left: 10px;
    }
    .fa-times {
        float: right;
        padding-right: 10px;
        color: #000;
    }
}

.form-img, .form-info {
    height: 465px;
    width: 50%;
}

.form-img {
    float: left;
    background-color: rgb(0, 0, 0);
}

.form-info {
    float: right;
    h2 {
        margin: 35px auto;
        font-size: 23px;
        max-width: 350px;
    }
    input {
        width: 80%;
        margin: 15px auto;
        display: block;
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

</style>
