<template>
      <div>
          <button @click="$emit('reset-filter')" key="button">Reset Filter</button>
      </div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>

div {
    width: 100%;
    height: auto;
    margin: 20px auto;
}

button {
    width: 150px;
    height: 45px;
    background-color: transparent; 
    color: #000;
    border: 1px solid;
    margin: auto;
    margin-bottom: 10px;
    display: block;
    font-weight: 400;
    transition: .3s ease-in;
    &:hover {
        cursor: pointer;
        background-color: #000;
        color: #fff;
    }
}   

</style>
