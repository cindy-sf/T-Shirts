<template>
    <div>
        <form id="uploader" ref="uploader" enctype="multipart/form-data" @submit="$event.preventDefault()">
            <div class="nav">
                <i class="fas fa-redo-alt" @click="resetValues" ref="resetIcon"></i>
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
                <div class="form-group">
                    <div class="select">
                        <label for="id_brand">Marque : </label>
                        <br>
                        <select name="id_brand" v-model="id_brand">
                            <option v-for="(brand, index) in brands" :key="index" :value="brand.id">{{ brand.name }}</option>
                        </select>
                    </div>

                    <div>
                        <label for="file-upload" class="custom-file-upload">
                            <i class="far fa-images"></i> {{ inputFileText }}
                        </label>
                        <input type="file" id="file-upload" ref="filePicker" :multiple="multiple === true || null"  @change="getLocalFiles($event.target.files)"/>
                    </div>

                </div>

                <br>
                <input type="number" placeholder="0 $" v-model="price" value="20" min="20" max="270">
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
            brands: [],
            //url_img: "",
            mimes: ['image/jpg+png+gif'],
            multiple: true,
            files: [],
            inputFileText : 'Ajoutez une image',
            axiosConfig:  {
                onUploadProgress:progressEvent => {
                        let loaded = Math.floor((progressEvent.loaded * 100) / progressEvent.total);
                        console.log(loaded);
                    }
            }
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

        resetValues() {
            Object.assign(this.$data, this.$options.data());
             this.$refs.resetIcon.style.color = "rgb(0, 0, 0)";
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
                url_img: this.files[0].name,
                color: this.color,
                description: this.description,
            })
            .then(response => {
                console.log(response)
                this.checkedTshirt();
                this.openModal();
                this.$refs.resetIcon.style.color = "rgb(56, 44, 167)";
            })
        },

        checkFilesExtensions([...files]) {
            var errors = 0;
            const log = [];
            files.forEach(file => {
                console.log(this.mimes)
                if(!this.mimes.includes(file.type)){
                    errors += 1;
                    if(!log.includes(file.type)){
                        log.push(file.type)
                    }
                }
            });
            return {
                errors : errors !== 0,
                log: log
            }
        },

        getLocalFiles(files) {
            const check = this.checkFilesExtensions(files);
            if(check.errors) {
                this.files = files;
                const fd = new FormData();
                Array.from(files).forEach(f => {
                    fd.append("uploader", f, f.name);
                });
                axios
                    .post(this.$backEndURL + "api/upload/", fd, this.axiosConfig)
                    .then(result => {
                        console.log(result);
                        this.inputFileText = "✓";
                    })
                    .catch(err => {
                        console.log(err);
                    });
            } else {
                console.error("file-type not allowed >", check.log)
            }
        },

        getBrands() {
            const url = "http://localhost:3030/api/brands";
            axios
            .get(url)
            .then(res => {
                this.brands = res.data;
                console.log(this.brands);
            })
            .catch(err => {
                console.log(err);
            })
        }
    },

    created() {
        this.getBrands();
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
    .fa-redo-alt {
        float: left;
        padding-left: 10px;
        line-height: 35px;
        cursor: pointer;
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
    background: url('../../assets/t-shirts/bg-t-shirt.png') center center no-repeat;
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
    position: fixed;
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

//Input File :
input[type="file"] {
    display: none;
}
.custom-file-upload {
    border: 1px solid #ccc;
    display: block;
    padding: 6px 12px;
    cursor: pointer;
    margin: auto;
    width: 200px;
    float: right;
    .fa-images {
        color: rgb(56, 44, 167);
        padding-right: 5px;
    }
}

select {
    height: 20px;
    display: block;
    margin-top: 5px;
}

.form-group {
    width: 80%;
    height: 35px;
    margin: auto;
    .select {
        width: 50%;
        height: 100%;
        display: flex;
        flex-wrap: wrap;
        float: left;
        + div {
            width: 50%;
            height: 100;
            float: right;
        }
        option {
            text-transform: capitalize;
        }
    }
    
}

label[for="id_brand"] {
    display: block;
    float: left;
    width: 100px;
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