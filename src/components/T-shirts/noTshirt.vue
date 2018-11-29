<template>
    <div>
        <img src="@/assets/t-shirts/t1.png" alt="">
        <p>ERREUR 404</p>
        <p>Aucun T-Shirt trouvé...</p>
    </div>
</template>

<script>

</script>

<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css?family=Roboto:400,500,700');
div {
    border-radius: 5px;
    box-shadow: 0px 0px 15px 0px rgba(50, 50, 50, 0.75);
    height: 250px;
    margin: 60px auto;
    width: 350px;
    p {
        margin: 20px;
        text-transform: none;
        text-align: center;
    }
    img {
        display: block;
        height: 100px;
        margin: 25px auto;
        object-fit: contain;
        width: 100px;
    }
    img + p {
        font-family: 'Roboto', sans-serif;
        font-weight: 700;
        letter-spacing: 5px;
    }
}
</style>
