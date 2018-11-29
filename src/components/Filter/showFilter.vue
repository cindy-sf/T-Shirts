<template>
    <div>
        <img src="@/assets/filter/1.png" key="img" class="img">
        <p>{{this.text}} <i :class="icon" @click="$emit('show-filters')"></i></p>
    </div>
</template>

<script>
    export default {
        data(){
            return {
                text: "Afficher les filtres",
                icon: "fas fa-angle-down",
            }
        },
        created() {
            this.$ebus.$on("text-content", payload => {
                this.text = payload;
            });

            this.$ebus.$on("icon", payload => {
                this.icon = payload;
            });
        }
    }
</script>

<style lang="scss" scoped>

div {
    width: 100%;
    height: auto;
    display: inline-flex;
    align-items: center;
}

i {
    margin-left: 10px;
    font-size: 15px;
    cursor: pointer;
    transition: all 1s linear;
}

img {
    width: 50px;
    height: 50px;
}

</style>
