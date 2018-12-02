<template>
    <form id="uploader" ref="uploader" enctype="multipart/form-data" @submit="$event.preventDefault()"> 
            <input type="file" id="file_picker" ref="filePicker" :multiple="multiple === true || null"  @change="getLocalFiles($event.target.files)">
    </form>
</template>

<script>
import axios from 'axios';
export default {
    data(){
        return {
            files: [],
            axiosConfig:  {
                onUploadProgress:progressEvent => {
                        let loaded = Math.floor((progressEvent.loaded * 100) / progressEvent.total);
                        console.log(loaded);
                    }
                }
        }
    },

    updated() {
        this.$ebus.$emit("img-file", this.files);
    },
    
    methods: {

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
                    errors : errors !==0,
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
                        console.log("files =>", this.files[0].name)
                    });

                    axios
                        .post(this.$backEndURL + "api/upload/", fd, this.axiosConfig)
                        .then(result => {
                            console.log(result)
                        })
                        .catch(err => {
                            console.log(err);
                        });
                } else {
                    console.error("file-type not allowed >", check.log)
                }

            }
    },


    props: ['mimes', 'multiple']

}
</script>

<style lang="scss" scoped>