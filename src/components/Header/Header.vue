<template>
    <header>
      <router-link
                  :to="{
                    path: '/'
                  }"
                >
        <h1>T-Shirts Challenge</h1>
      </router-link>
      <div class="card-number">
        <i class="fas fa-shopping-cart"></i>
        <p>{{  }}</p>
      </div>
      <router-link
        :to="{
          path: '/Admin'
        }"
      >
      <i class="far fa-user"></i>
      </router-link>
    </header>
</template>

<script>
export default {
    // computed: {
    //   numProductsAdded () {
    //     return this.$store.getters.productsAdded.length;
    //   }
    // },
}
</script>

<style lang="scss" scoped>
.card-number {
  width: auto;
  height: auto;
  p {
    position: absolute;
    bottom: 15px;
    right: 20px;
  }
}
header {
  height: 70px;
  width: 100%;
  top: 0;
  position: fixed;
  text-align: center;
  background-color: #fff;
  box-shadow: 0px 2px 8px 0px rgba(50, 50, 50, 0.192);
  padding: 0px 20px;
  z-index: 1;
  h1 {
    display: inline;
    line-height: 70px;
    float: left;
    color: #000;
  }
  .fas, .far {
    display: inline;
    float: right;
    line-height: 70px;
    font-size: 20px;
    margin: 0px 10px;
    cursor: pointer;
  }
  a {
    color: #000;
  }
}
</style>

